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
        Schema::create('discount', function (Blueprint $table) {
            $table->string('code');
            $table->string('note')->nullable();
            $table->integer('discount');
            $table->integer('price_limit');
            $table->integer('purchase_limit');
            $table->integer('num_used')->default(0);
            $table->dateTime('expiration_date');
            $table->dateTime('created_at')->useCurrent();
            $table->dateTime('updated_at')->useCurrent();
            $table->bigInteger('created_by')->unsigned();
            $table->bigInteger('updated_by')->unsigned();
            $table->integer('active');
            $table->primary('code');
            $table->foreign('created_by')->references('id')->on('users');
            $table->foreign('updated_by')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('discount');
    }
};
