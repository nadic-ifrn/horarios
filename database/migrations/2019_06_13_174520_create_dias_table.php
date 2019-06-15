<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDiasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dias', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->boolean('seg');
            $table->boolean('ter');
            $table->boolean('qua');
            $table->boolean('qui');
            $table->boolean('sex');
            $table->boolean('especial');
            $table->text('observacao')->nullable();
            $table->unsignedBigInteger('ano_letivo_id');
            $table->foreign('ano_letivo_id')->references('id')->on('ano_letivos');
            $table->unsignedBigInteger('professor_id');
            $table->foreign('professor_id')->references('id')->on('professors');
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
        Schema::dropIfExists('dias');
    }
}
