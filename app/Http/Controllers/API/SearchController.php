<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\User;
use Illuminate\Support\Facades\Auth;

class SearchController extends Controller
{
    public $successStatus = 200;

    public function searchUser(Request $request)
    {
        $user = auth::user();
        $text = $request->get('text');
        $searchUser = DB::table('users')->where('name','like','%'.$text.'%')
            ->where('id','!=',$user->id)
            ->get();

        return response()->json(['success' => $searchUser], $this->successStatus);
    }
}
