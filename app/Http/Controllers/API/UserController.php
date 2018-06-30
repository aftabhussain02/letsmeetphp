<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Validator;

class UserController extends Controller
{
    public $successStatus = 200;
    /**
     * login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(){
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
            $user = Auth::user();
            $success['token'] =  $user->createToken('MyApp')-> accessToken;
            return response()->json(['success' => $success], $this-> successStatus);
        }
        else{
            return response()->json(['error'=>'Unauthorised'], 401);
        }
    }
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $input = $request->all();
        $input->name = ucfirst(strtolower($input->name));
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('MyApp')-> accessToken;
        $success['name'] =  $user->name;
        return response()->json(['success'=>$success], $this-> successStatus);
    }
    /**
     * details api
     *
     * @return \Illuminate\Http\Response
     */
    public function details()
    {
        $user = Auth::user();
        return response()->json(['success' => $user], $this-> successStatus);
    }

    public function editUser(Request $request){

        $user = Auth::user();

        $request->validate([
           'editName' => 'required|max:100',
            'editEmail' => Rule::unique('users','email')->ignore($user->email,'email')
        ]);

        $image = $request->get('editPicture');
        $imageBolean = str_contains($image, 'base64');

        if($imageBolean) {
            $image=str_replace('data:image/png;base64,', '', $image);
            $image=str_replace(' ', '+', $image);
            $image=base64_decode($image);
            $imageName=str_random(10) . '.' . 'png';
            $imagePath = "uploads/profile/" . $imageName;
            Storage::disk('public')->delete($user->picture);
            Storage::disk('public')->put($imagePath, $image);

            $user->picture=$imagePath;
        }
        $user->name = ucfirst(strtolower($request->get('name')));

        $user->email = $request->get('editEmail');

        if($user->isDirty()){
            $user->save();
        }

        return response()->json(['success' => $user], $this->successStatus);
    }
}