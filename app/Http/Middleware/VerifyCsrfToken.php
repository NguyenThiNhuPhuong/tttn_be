<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    /* protected $except = [
        //
    ]; */
    protected $except = [
        //This is the url that I dont want Csrf for postman.
      /*   'http://localhost:8080/tttn_be/public/user/register/add',  */
       
        
    ];
}
