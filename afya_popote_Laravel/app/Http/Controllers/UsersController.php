<?php

namespace App\Http\Controllers;

use App\Models\Appointments;
use App\Models\User;
use App\Models\Doctor;
use App\Models\UserDetails;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = array(); //this will return a set of user and doctor data
        $user = Auth::user();
        $doctor = User::where('type', 'doctor')->get();
        $details = $user->user_details;
        $doctorData = Doctor::all();
        //this is the date format without leading
        $date = now()->format('n/j/Y'); //change date format to suit the format in database

        //make this appointment filter only status is "Nilizo_omba"
        $appointment = Appointments::where('status', 'Nilizo_omba')->where('date', $date)->first();

        //collect user data and all doctor details
        foreach($doctorData as $data){
            //sorting doctor name and doctor details
            foreach($doctor as $info){
                if($data['doc_id'] == $info['id']){
                    $data['doctor_name'] = $info['name'];
                    $data['doctor_profile'] = $info['profile_photo_url'];
                    if(isset($appointment) && $appointment['doc_id'] == $info['id']){
                        $data['appointments'] = $appointment;
                    }
                }
            }
        }

        $user['doctor'] = $doctorData;
        $user['details'] = $details; //return user details here together with doctor list

        return $user; //return all data
    }

    /**
     * loign.
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $reqeust)
    {
        //validate incoming inputs
        $reqeust->validate([
            'email'=>'required',
            'password'=>'required',
        ]);

        //check matching user
        $user = User::where('email', $reqeust->email)->first();

        //check password
        if(!$user || ! Hash::check($reqeust->password, $user->password)){
            throw ValidationException::withMessages([
                'email'=>['The provided credentials are incorrect'],
            ]);
        }

        //then return generated token
        return $user->createToken($reqeust->email)->plainTextToken;
    }

    /**
     * register.
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        //validate incoming inputs
        // $request->validate([
        //     'name'=>'required|string',
        //     'email'=>'required|email',  
        //     'age'=>'age',
        //     'gender'=>'gender',
        //     'nationality'=>'nationality',
        //     'region'=>'region',
        //     'district'=>'district',
        //     'ward'=>'ward',
        //     'disability'=>'disability',
        //     'occupation'=>'occupation',
        //     'patientNumber'=>'patientNumber',
        //     'password'=>'password',
        //     'confirmPass'=>'confirmPass',
        // ]);

        $user = User::create([
            'name'=>$request->name,
            'email'=>$request->email,
            'age'=>$request->age,
            'gender'=>$request->gender,
            'nationality'=>$request->nationality,
            'region'=>$request->region,
            'district'=>$request->district,
            'ward'=>$request->ward,
            'disability'=>$request->disability,
            'occupation'=>$request->occupation,
            'patientNumber'=>$request->patientNumber,
            'password'=>$request->password,
            'confirmPass'=>$request->confirmPass,
            'type'=>'user',
            'password'=>Hash::make($request->password),
        ]);

        $userInfo = UserDetails::create([
            'user_id'=>$user->id,
            'status'=>'active',
        ]);

        return $user;


    }

    /**
     * update favorite doctor list
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeFavDoc(Request $request)
    {

        $saveFav = UserDetails::where('user_id',Auth::user()->id)->first();

        $docList = json_encode($request->get('favList'));

        //update fav list into database
        $saveFav->fav = $docList;  //and remember update this as well
        $saveFav->save();

        return response()->json([
            'success'=>'The Favorite List is updated',
        ], 200);
    }

    /**
     * logout.
     *
     * @return \Illuminate\Http\Response
     */
    public function logout(){
        $user = Auth::user();
        $user->currentAccessToken()->delete();

        return response()->json([
            'success'=>'Logout successfully!',
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   
    public function edit(User $users)
    {
        return view('patients.edit',compact('users'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
     public function update(Request $request, User $users)
    {
        $request->validate([
            'status' => 'required',
        ]);
    
        $patient->update($request->all());
    
        return redirect()->route('patients.index')
                        ->with('success','Patient updated successfully');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function checkEmail(Request $request)
    {
        // Validate incoming request
        $request->validate([
            'email' => 'required|email',
        ]);

        // Check if a user with the given email exists
        $email = $request->input('email');
        $user = User::where('email', $email)->first();

        if ($user) {
            // User with the given email exists
            return response()->json([
                'exists' => true,
                'user' => $user,
            ], 200);
        } else {
            // User with the given email does not exist
            return response()->json([
                'exists' => false,
            ], 200);
        }
    }
}
