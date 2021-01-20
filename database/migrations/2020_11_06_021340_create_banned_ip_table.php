<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBannedIpTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banned_ips', function (Blueprint $table) {
            $table->increments('id');
            $table->string('ip');
            $table->enum('status', array('banned','unbanned'));
            $table->enum('abuse', array('reported','unreported'));
            $table->integer('jail_id')->nullable()->unsigned();
            $table->json('info')->nullable();
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
        Schema::dropIfExists('banned_ips');
    }
}
