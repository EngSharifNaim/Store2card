<?php

namespace App\Http\Controllers\api\v1;

use App\Http\Controllers\Controller;
use App\UpgradeRequst;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Nyholm\Psr7\Response;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        if(!isset($request->password) || !isset($request->email))
        {
            return response([
                'code' => '406',
                'status' => false,
                'message' => 'Password and email are required'
            ]);

        }

       // check if email is exist in database
        $user = User::where('email',$request->email)->first();
        if(!$user)
        {
            return response([
                'code' => '404',
                'status' => false,
                'message' => 'User email does not exist'
                ]);
        }
        // end check email
        $login = $request->all();
        if(!Auth::attempt($login))
        {
            return response([
                'code' => '401',
                'status' => false,
                'message' => 'Login failed'
            ]);
        }
        else
        {
            if(Auth::user()->status == 1)
            {
                $accessToken = Auth::User()->createToken('authToken')->accessToken;

                return response([
                    'code' => '200',
                    'status' => true,
                    'message' => 'Login successfully',
                    'user' => Auth::User(),
                    'accessToken' => $accessToken
                ]);
            }
            else
            {
                return response([
                    'code' => '403',
                    'status' => false,
                    'message' => 'Mobile not verified',
//                    'hasRequest' => $haserequest,
                    'user' => Auth::User()

                ]);

            }

        }
    }

}
