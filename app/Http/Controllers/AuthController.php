<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function form_login()
    {
        return view('admin.pages.form_login');
    }

    public function login(Request $request)
    {
        $user = User::where('email', $request->email)->first();
        if (empty($user)) {
            return redirect()->back()->with('error', 'Credentials are wrong.');
        }
        if (Auth::attempt(["email" => $user->email, "password" => $request->password])) {
            return redirect()->route('admin.dashboard')->with('success', "Berhasil login");
        }
        return redirect()->back()->with('error', 'Credentials are wrong.');
    }
}
