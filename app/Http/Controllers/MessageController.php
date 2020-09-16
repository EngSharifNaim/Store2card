<?php

namespace App\Http\Controllers;

use App\Message;
use Illuminate\Http\Request;

class MessageController extends Controller
{
    public function index()
    {
        $messages = Message::paginate(20);
        return view('dashboard.messages.index',compact('messages'));
    }
}
