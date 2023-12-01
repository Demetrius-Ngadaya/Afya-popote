<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('type'); //add this as user model has this as well
            $table->string('email')->unique();
            $table->string('age');
            $table->string('gender');
            $table->string('nationality');
            $table->string('region');
            $table->string('district');
            $table->string('ward');
            $table->string('disability');
            $table->string('occupation');
            $table->string('patientNumber');
            $table->string('password');
            $table->string('confirmPass');
            $table->rememberToken();
            $table->foreignId('current_team_id')->nullable();
            $table->string('profile_photo_path', 2048)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
