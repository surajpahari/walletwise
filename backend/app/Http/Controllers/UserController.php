<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Exception;
use Illuminate\Support\Facades\Validator;
use Auth;


class UserController extends Controller
{
    public function create(Request $request){

        $validator = Validator::make($request->all(), [
            'name' => ['required'],
            'email' => ['required', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
            ], 422); // 422 Unprocessable Entity status code for validation errors
        }

        try {

            // Create and save the new user
            $user = new User;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->save();

            // Return a JSON response
            return response()->json([
                'status' => true,
                'message' => "User created successfully",
                'token' => $user->createToken("API TOKEN")->plainTextToken,
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => "Error creating user",
            ], 401);
        }
    }

    public function login(Request $request){
        try{
        $validator = Validator::make($request->all(), [
            'email' => ['required'],
            'password' => ['required'],
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
            ], 422); // 422 Unprocessable Entity status code for validation errors
        }
        if(!Auth::attempt($request->only(['email','password']))){
            return response()->json([
                'status'=>false,
                'message'=>"Credentials does not match."
            ]);
        }
        $user = User::where('email',$request->email)->first();
        return response()->json([
                'status' => true,
                'message' => "Logged in  successfully",
                'token' => $user->createToken("API TOKEN")->plainTextToken,
            ], 200);

        }catch(Exception $e){
            return response()->json(
                [
                    'status'=>false,
                    'message'=>"Failed to log in",
                    'erros'=>$validator->errors()

                ],500

            );
        }
    }

}

