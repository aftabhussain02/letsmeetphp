<?php
namespace App\Http\Controllers\API;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Chatkit\Chatkit;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Validator;

class UserController extends Controller
{
    public $successStatus = 200;
    private $chatkit;

    public function __construct()
    {
        $this->chatkit = new Chatkit([
            'instance_locator' => 'v1:us1:ac2d862a-9a68-42ff-a7cf-d571119e2414',
            'key' => '62ecf620-64db-44bf-94fc-78e48ccd087c:MFSQHaELirSW6ZBTsPif63SXG6F1VdM98xPXpGqvUUM='
        ]);
    }
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
            'email' => 'required|email|unique:users,email',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);
        }
        $input = $request->all();
        $input['name'] = ucfirst(strtolower($input['name']));
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('MyApp')-> accessToken;
        $success['name'] =  $user->name;

        $chatUser = $this->chatkit->createUser([
            'id' => (string)$user->id,
            'name' => $user->name
        ]);

        return response()->json(['success'=>$chatUser], $this-> successStatus);
    }
    /**
     * details api
     *
     * @return \Illuminate\Http\Response
     */
    public function user()
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