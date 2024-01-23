<?php

namespace App\Http\Controllers;

use App\Http\Requests\AuthRequests\LoginRequest;
use App\Http\Requests\UserRequests\CreateUserRequest;
use App\Traits\HttpResponses;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Exception;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\JsonResponse;

class UserController extends Controller
{
    use HttpResponses;

    public function store(CreateUserRequest $request): JsonResponse
    {
        $fields = $request->validated();
        $fields['password'] = Hash::make($fields['password']);

        try {
            $user = User::create($fields);

            return $this->success(
                'User created successfully',
                $user->createToken("API TOKEN")->plainTextToken
            );

        } catch (Exception $e) {
            return $this->success(
                'Error creating user',
                null,
                401
            );
        }
    }

    public function authenticate(LoginRequest $request): JsonResponse
    {
        try {
            if(!Auth::attempt($request->only(['email','password']))) {
                return $this->error(
                    "Credentials does not match.",
                    null,
                    422
                );
            }

            $user = User::where('email', $request->email)->first();

            return $this->success(
                'Logged in successfully.',
                $user->getPlainApiToken()
            );

        } catch(Exception $e) {
            return $this->error(
                'Failed to log in.',
                $e->getMessage(),
                500
            );
        }
    }

    public function logout(): JsonResponse
    {
        Auth::user()->currentAccessToken()->delete();

        return $this->success('Successfully logged out');
    }

}
