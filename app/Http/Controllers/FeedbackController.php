<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Feedback;
use Throwable;

class FeedbackController extends Controller
{
    protected $feedback;


    function __construct()
    {
        $this->feedback = new Feedback;
    }

    function add(Request $request)
    {
        try {
            $validated = $request->validate([
                'email' => 'required',
                'content' => 'required',
            ]);
            $this->feedback->email = $request->email;
            $this->feedback->content = $request->content;
            $this->feedback->user_id = Auth::user()->id;
            $this->feedback->save();
            return response()->json([
                'result' => true,
                'message' => 'Ý kiến của bạn đã được gửi!',
                'feedback' => $this->feedback,

            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Gửi ý kiến không thành công, vui lòng thử lại!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }

    function listFeedback()
    {

        return response()->json([
            'result' => true,
            'listFeedback' => $this->feedback->getAll(),
        ]);
    }

    function feedback($id)
    {

        return response()->json([
            'result' => true,
            'feedback' => $this->feedback->getFeedback($id),
        ]);
    }
    function delete($id)
    {

        $result = $this->feedback->deletes($id);
        if ($result) {
            return response()->json([
                'result' => true,
                'message' => "Xóa phản hồi thành công!"
            ]);
        } else {
            return response()->json([
                'result' => false,
                'message' => "Xóa phản hồi bị lỗi, vui lòng thử lại!"
            ]);
        }
    }
}