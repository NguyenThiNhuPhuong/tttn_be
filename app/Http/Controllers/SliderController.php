<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Slider;
use Throwable;

class SliderController extends Controller
{

    protected $user;
    protected $slider;

    function __construct()
    {
        $this->user = new User;
        $this->slider = new Slider;
    }

    function add(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required',
                'image' => 'required',
            ]);
            $this->slider->name = $request->name;
            $this->slider->image = $request->image;
            $this->slider->link = $request->link;
            $this->slider->active = $request->active;
            $this->slider->created_by = Auth::user()->id;
            $this->slider->updated_by = Auth::user()->id;

            $this->slider->save();
            return response()->json([
                'result' => true,
                'message' => 'Thêm slider thành công!',
                'slider' => $this->slider,

            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Thêm slider lỗi!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }

    function listSlider()
    {
        return response()->json([
            'result' => true,
            'listSlider' => $this->slider->getAll(),
        ]);
    }

    function slider($id)
    {

        return response()->json([
            'result' => true,
            'slider' => $this->slider->getslider($id),
        ]);
    }

    function edit(Request $request)
    {
        try {
            $this->slider->find($request->id)->update([
                'name' => $request->name,
                'active' => $request->active,
                'image' => $request->image,
                'link' => $request->link,
                'updated_by' => Auth::user()->id,
            ]);
            return response()->json([
                'result' => true,
                'message' => 'Cập nhật slider thành công!',
                'slider' =>  $this->slider->getslider($request->id)

            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Cập nhật slider không thành công!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }

    function delete($id)
    {

        $result = $this->slider->deletes($id);
        if ($result) {
            return response()->json([
                'result' => true,
                'message' => "Xóa slider thành công!"
            ]);
        } else {
            return response()->json([
                'result' => false,
                'message' => "Xóa slider bị lỗi, vui lòng thử lại!"
            ]);
        }
    }
}
