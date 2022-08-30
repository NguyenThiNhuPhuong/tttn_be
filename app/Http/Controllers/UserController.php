<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Throwable;

class UserController extends Controller
{
    protected $user;

    function __construct()
    {
        //$this->middleware('auth:api', ['except' => ['login']]);
        $this->user = new User;
    }

    function register(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required',
                'email' => 'required|email|unique:users',
                'password' => 'required|min:6',
                'password_confirm' => 'required|same:password',
            ]);

            $this->user->name = $request->name;
            $this->user->email = $request->email;
            $this->user->type_id = $request->type_id;
            $this->user->password = bcrypt($request->password);
            $this->user->created_by = $request->created_by;
            $this->user->updated_by = $request->updated_by;
            $this->user->save();

            return response()->json([
                'result' => true,
                'message' => 'Đăng ký tài khoản thành công!',
                'data' => $this->user,
            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Tài khoản đã tồn tại, Vui lòng thử lại!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }

    function login(Request $request)
    {
        try {
            $validated = $request->validate([
                'email' => 'required|email:filter',
                'password' => 'required|min:6',
            ]);
            if ($token = Auth::attempt(['email' => $request->email, 'password' => $request->password],)) {
                /* $this->respondWithToken($token); */
                return response()->json([
                    'result' => true,
                    'access_token' => $token,
                    'token_type' => 'bearer',
                    'expires_in' => Auth::factory()->getTTL() * 60,
                    'user' => Auth::user(),
                ]);
            } else {
                return response()->json([
                    'result' => false,
                    'message' => 'Tài khoản đăng nhập không đúng, vui lòng thử lại!',
                ]);
            }
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Tài khoản đăng nhập không đúng, vui lòng thử lại!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }
    function profile()
    {
        try {
            return response()->json([
                'result' => true,
                'user' => Auth::user(),
            ]);
        } catch (Throwable $err) {

            return response()->json([
                'result' => false,
                'error' =>  $err->getMessage(),
            ]);
        }
    }
    function logout()
    {
        try {
            Auth::logout();
            return response()->json([
                'result' => true,
                'message' => 'Đăng xuất thành công!',
            ]);
        } catch (Throwable $err) {

            return response()->json([
                'result' => false,
                'error' =>  $err->getMessage(),
            ]);
        }
    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => Auth::factory()->getTTL() * 60,
            'user' => Auth::user(),
        ]);
    }
}