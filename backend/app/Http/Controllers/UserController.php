<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Exception;

class UserController extends Controller
{
    public function create(Request $request){
        $this->validate($request,  [
            'name' => ['required'],
            'username'=> ['required','unique:users'],
            'email' => ['required', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]
        );
        try{
        $user = new User;
        $user ->name = $request->name;
        $user ->role_id= 1;
        $user ->username = $request->username;
        $user ->email = $request->email;
        $user ->password = Hash::make($request->password);
        $user->save();
        }catch(Exception $e){
            return 0 ;
        }
    }
    //
}
