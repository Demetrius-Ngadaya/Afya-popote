<?php

use App\Http\Controllers\DocsController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\PatientsController;
use App\Http\Controllers\ViewsController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\CommentsController;   
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('login');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', [DocsController::class, 'index'])->name('dashboard');
});

Route::resource('patients', PatientsController::class);

// Add a nested resource for appointments under patients
Route::resource('patients.appointments', AppointmentsController::class)->except(['index', 'create', 'store', 'show']);

// Add a custom route for showing a specific appointment for a patient
Route::get('patients/{patient}/appointments/{appointment}', [PatientsController::class, 'showAppointment'])->name('patients.appointments.show');


Route::resource('comments.comments', CommentsController::class);

Auth::routes();

Route::get('/dashboard', [App\Http\Controllers\DashboardController::class, 'index'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::view('comments', 'comments')->name('comments');

    Route::get('users', [\App\Http\Controllers\UserController::class, 'index'])->name('users.index');

    Route::get('profile', [\App\Http\Controllers\ProfileController::class, 'show'])->name('profile.show');
    Route::put('profile', [\App\Http\Controllers\ProfileController::class, 'update'])->name('profile.update');
});
Route::get('/receive', [App\Http\Controllers\PatientsController::class,  'receive'])->name('receive');
Route::get('/attended', [App\Http\Controllers\PatientsController::class,  'attended'])->name('attended');
Route::get('/not_attended', [App\Http\Controllers\PatientsController::class,  'not_attended'])->name('not_attended');

