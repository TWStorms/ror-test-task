<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('username');
            $table->string('email')->unique();
            $table->timestamp('verified_at')->nullable();
            $table->string('password');
            $table->string('phone_number');
            $table->integer('parent_id')->nullable();
            $table->longText('referer_code')->comment("");
            $table->longText('email_verification_code')->nullable()->comment("Code to verify email");
            $table->integer('level_completed')->comment("levels completed by user");
            $table->longText('registration_code')->comment("for completing user registration");
            $table->integer('child_count')->comment("total child");
            $table->boolean('verify')->comment("0 = verify, 1 = un-verify");
            $table->boolean('status')->comment("0 = active, 1 = in-active");
            $table->rememberToken();
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
}
