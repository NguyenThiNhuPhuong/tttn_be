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

    function add(Request $request)
    { 
        try{
            $validated = $request->validate([
                'name' => 'required',
                'email' => 'required|unique:users',
                'password' => 'required',
                're_password' => 'required',
            ]);
    
            $this->user->name = $request->name;
            $this->user->email = $request->email;
            $this->user->type_id = $request->type_id;
            $this->user->password = bcrypt($request->password);
            $this->user->created_by= $request->created_by;
            $this->user-> updated_by = $request->updated_by;
            $this->user->save();

            return response()->json([
                'success' => true,
                'data'=> $this->user,
            ]);
        }catch (Throwable $err){
            return response()->json([
                'success' => false,
                'error'=>  $err->getMessage(),
            ]);
           
        }
    }
}
