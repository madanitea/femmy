<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jails', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->integer('filter_id')->unsigned();
            $table->string('logpath');
            $table->string('port');
            $table->integer('find_time');
            $table->integer('max_retry');
            $table->bigInteger('ban_time');
            $table->integer('host_id')->unsigned();
            $table->string('status');
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
        Schema::dropIfExists('jails');
    }
}
