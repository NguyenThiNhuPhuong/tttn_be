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
        Schema::create('order', function (Blueprint $table) {
            $table->id();
            $table->string('ordercode')->unique();
            $table->bigInteger('user_id')->unsigned();
            $table->string('fullname');
            $table->string('phone');
            $table->string('email');
            $table->integer('price_product');
            $table->string('discount_code')->nullable();
            $table->integer('price_ship');
            $table->integer('price_all');
            $table->bigInteger('province_id');
            $table->bigInteger('district_id');
            $table->bigInteger('ward_id');
            $table->string('address');
            $table->bigInteger('orderstatus_id')->unsigned();
            $table->longText('note');
            $table->dateTime('created_at')->useCurrent();
            $table->dateTime('updated_at')->useCurrent();
            $table->foreign('province_id')->references('id')->on('province');
            $table->foreign('district_id')->references('id')->on('district');
            $table->foreign('ward_id')->references('id')->on('ward');
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('discount_code')->references('code')->on('discount');
            $table->foreign('orderstatus_id')->references('id')->on('order_status');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order');
    }
};
