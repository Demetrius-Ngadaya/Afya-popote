<?php

namespace App\Http\Controllers;

use App\Models\Patient;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Appointments;
use App\Models\Doctor;
use App\Models\UserDetails;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $appointments = Appointments::with(['user', 'doctor'])->get();

        $newAppointmentsCount = $appointments->where('status', 'Nilizo_omba')->count();
        $receivedAppointmentsCount = $appointments->where('status', 'Zilizo_pokewa')->count();
        $attendedAppointmentsCount = $appointments->where('status', 'Nilizo_enda')->count();
        $notAttendedAppointmentsCount = $appointments->where('status', 'Nisizo_enda')->count();

        return view('dashboard', compact(
            'newAppointmentsCount',
            'receivedAppointmentsCount',
            'attendedAppointmentsCount',
            'notAttendedAppointmentsCount'
        ))->with('i', (request()->input('page', 1) - 1) * 5);
    }
}
