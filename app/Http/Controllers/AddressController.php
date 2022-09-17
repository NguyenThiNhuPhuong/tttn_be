<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\District;
use App\Models\Ward;
use App\Models\Province;

class AddressController extends Controller
{
    protected $district;
    protected $ward;
    protected $province;

    function __construct()
    {
        $this->district = new District;
        $this->ward = new Ward;
        $this->province = new Province;
    }

    function listProvince()
    {
        return response()->json([
            'result' => true,
            'listProvince' => $this->province->getAll(),
        ]);
    }
    function listDistrict()
    {
        return response()->json([
            'result' => true,
            'listDistrict' => $this->district->getAll(),
        ]);
    }
    function listWard()
    {
        return response()->json([
            'result' => true,
            'listWard' => $this->ward->getAll(),
        ]);
    }
}
