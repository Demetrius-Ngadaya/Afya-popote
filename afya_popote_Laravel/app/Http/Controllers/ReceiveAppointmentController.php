<?php
namespace App\Http\Controllers;

use App\Models\Patient;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Doctor;
use App\Models\UserDetails;
use Illuminate\Support\Facades\DB;
use App\Models\Appointments;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class ReceiveAppointmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    }
    public function receive()
    {
        $appointments = Appointments::with(['user', 'doctor'])->get();
        $receivedAppointmentsCount = $appointments->where('status', 'Zilizo_pokewa');
        return view('receive', compact(
            'receivedAppointmentsCount'
        ))->with('i', (request()->input('page', 1) - 1) * 5);
    }



    
 //The following function helps to retrieve appoitment details

 public function showAppointment(User $patient, Appointments $appointment)
 {
     return view('patients.show', compact('patient', 'appointment'));
 }
 
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'detail' => 'required',
        ]);
        Patient::create($request->all());
  
        return redirect()->route('patients.index')
                         ->with('success','User created successfully.');
    }
     
    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(User $patient)
    {
        return view('patients.show',compact('patient'));
    } 
     
    
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(User $patient)
    {
        return view('patients.edit',compact('patient'));
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
   

    public function update(Request $request, User $patient)
{
    $request->validate([
        'status' => 'required',
    ]);

    // Assuming the relationship between User and Appointments is defined correctly
    if ($patient->appointments->first()) {
        $patient->appointments->first()->update(['status' => $request->status]);
    }

    return redirect()->route('dashboard')->with('success', 'Patient status updated successfully');
}
    
    
}
