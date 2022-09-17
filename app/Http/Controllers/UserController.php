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
        $this->user = new User;
    }

    function register(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required',
                'email' => 'required|email|unique:users',
                'address'=> 'required',
                'phone'=> 'required',
                'password' => 'required|min:6',
                'password_confirm' => 'required|same:password',
            ]);

            $this->user->name = $request->name;
            $this->user->email = $request->email;
            $this->user->type_id = $request->type_id;
            $this->user->password = bcrypt($request->password);
            $this->user->phone = $request->phone;
            $this->user->avatar = 'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png';
            $this->user->address = $request->address;
            $this->user->save();

            return response()->json([
                'result' => true,
                'message' => 'Đăng ký tài khoản thành công!',
                'user' => $this->user,
            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Đăng ký tài khoản không thành công, Vui lòng thử lại!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }
    function registerAdmin(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required',
                'email' => 'required|email|unique:users',
                'address'=> 'required',
                'avatar'=> 'required',
                'phone'=> 'required',
                'password' => 'required|min:6',
                'password_confirm' => 'required|same:password',
            ]);

            $this->user->name = $request->name;
            $this->user->email = $request->email;
            $this->user->type_id = $request->type_id;
            $this->user->password = bcrypt($request->password);
            $this->user->created_by = $request->created_by;
            $this->user->phone = $request->phone;
            $this->user->avatar = $request->avatar;
            $this->user->address = $request->address;
            $this->user->created_by = Auth::user()->id;
            $this->user->save();

            return response()->json([
                'result' => true,
                'message' => 'Đăng ký tài khoản thành công!',
                'user' => $this->user,
            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Đăng ký tài khoản không thành công, Vui lòng thử lại!',
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
            if ($token = Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
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

    function listUser()
    {
        return response()->json([
            'result' => true,
            'listUser' => $this->user->getAll(),
        ]);
    }
    function profileId($id)
    {

        return response()->json([
            'result' => true,
            'user' => $this->user->getUser($id),
        ]);
    }
    function profile()
    {
        try {
           if(Auth::user()!=null){ 
                return response()->json([
                    'result' => true,
                    'user' => Auth::user(),
                ]);
            }else{
                return response()->json([
                    'result' => false,
                    'user' => Auth::user(),
                ]);
            }
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
    function edit(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required',
                'address' => 'required',
                'phone' => 'required',
                'avatar'=>'required',
            ]);

          $result= $this->user->find($request->id)->update([
            'name' => $request->name,
                'phone' => $request->phone,
               'address' => $request->address,
                'avatar' => $request->avatar,
                'type_id'=> $request->type_id,
                'updated_by' => Auth::user()->id,
            ]);
           
                return response()->json([
                    'result' => $result,
                    'message' => 'Cập nhật thông tin thành công!',
                ]);
           
           
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Cập nhật thông tin không thành công!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }
}
