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
        Schema::create('product', function (Blueprint $table) {
            $table->id();
            $table->string('name',255);
            $table->bigInteger('category_id')->unsigned();
            $table->longText('content');
            $table->integer('price');
            $table->integer('price_sale');
            $table->integer('num');
            $table->integer('num_buy')->default(0);
            $table->integer('active')->default(1);
            $table->string('image',255);
            $table->dateTime('created_at')->useCurrent();
            $table->dateTime('updated_at')->useCurrent();
            $table->bigInteger('created_by')->unsigned();
            $table->bigInteger('updated_by')->unsigned();
            $table->foreign('created_by')->references('id')->on('users');
            $table->foreign('updated_by')->references('id')->on('users');
            $table->foreign('category_id')->references('id')->on('category');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product');
    }
};
