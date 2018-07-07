<?php
namespace App\Http\Controllers\API;

use App\ChatRooms;
use App\Http\Controllers\Controller;
use Chatkit\Chatkit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ChatController extends Controller
{
    private $chatkit;
    private $instanceId;
    private $key;

    public function __construct()
    {
        $this->instanceId = 'v1:us1:ac2d862a-9a68-42ff-a7cf-d571119e2414';
        $this->key = '62ecf620-64db-44bf-94fc-78e48ccd087c:MFSQHaELirSW6ZBTsPif63SXG6F1VdM98xPXpGqvUUM=';
        $this->chatkit = new Chatkit([
            'instance_locator' => $this->instanceId,
            'key' => '62ecf620-64db-44bf-94fc-78e48ccd087c:MFSQHaELirSW6ZBTsPif63SXG6F1VdM98xPXpGqvUUM='
        ]);
    }

    public function auth()
    {
        $user = Auth::user();
        $auth = $this->chatkit->authenticate(['user_id' => "$user->id"]);

        return response()->json($auth['body'], $auth['status']);
    }

    public function createUsers(Request $request)
    {
        $this->chatkit->createUser([
            'id' => $request->id,
            'name' => $request->name
        ]);

        return response()->json('success', 200);
    }

    public function createRoom(Request $request)
    {
        $authuser = Auth::user();
        $users = $request->input('users');
        $sender = $users['sender'];
        $receiver = $users['receiver'];
        $user_ids = [(string)$sender['id'], (string)$receiver['id']];

        $roomexist = $this->roomExist($user_ids);
        if($roomexist){
            $roomexist->sender = $sender;
            $roomexist->receiver = $receiver;
            return response()->json(['success' => $roomexist], 200);
        }

        $room = $this->chatkit->createRoom([
            'creator_id' => (string)$authuser['id'],
            'name' => 'consevation room',
            'private' => true,
            'user_ids' => $user_ids
        ]);

        $db = DB::table('chat_rooms')->insert([
            'id' => $room['body']['id'],
            'users' => implode($room['body']['member_user_ids'],',')
        ]);

        $room['body']['sender'] = $sender;
        $room['body']['receiver'] = $receiver;


        return response()->json(['success' => $room['body']], $room['status']);
    }

    public function roomExist($user_ids)
    {

        $room = DB::table('chat_rooms')
            ->where('users','like','%'.$user_ids[0].'%')
            ->where('users','like','%'.$user_ids[1].'%')
            ->first();

        return $room;
    }

    public function sendMessage()
    {
        $message = $this->chatkit->sendMessage([
            'sender_id' => '2',
            'room_id' => 10893420,
            'text' => 'This is a wonderful message.'
        ]);

        return response()->json($message);
    }

    public function getRooms()
    {
        $user=Auth::user();

        $rooms=DB::table('chat_rooms')
            ->where('users', 'like', '%' . $user->id . '%')
            ->get();

        foreach ($rooms as $room) {
            $userArray=explode(',' ,$room->users);
            $userArray=array_diff($userArray, array($user->id));

            $receiver=DB::table('users')
                ->where('id', array_shift($userArray))
                ->first(['id','picture', 'name']);

            $room->sender=$user;
            $room->receiver=$receiver;
        }

        return response()->json(['success'=>$rooms], 200);
    }

    public function updateRoom($id)
    {
        $room = ChatRooms::find($id);
        $room->touch();

        return $this->getRoom($id);
    }

    public function getRoom($id)
    {
        $user = Auth::user();
        $room = ChatRooms::find($id);

        $userArray=explode(',' ,$room->users);
        $userArray=array_diff($userArray, array($user->id));

        $receiver=DB::table('users')
            ->where('id', array_shift($userArray))
            ->first(['id','picture', 'name']);

        $room->sender->id=$user['id'];
        $room->sender->name=$user['name'];
        $room->sender->picture=$user['picture'];
        $room->receiver->id=$receiver['id'];
        $room->receiver->name=$receiver['name'];
        $room->receiver->picture=$receiver['picture'];

        return response()->json(['success'=>$room], 200);
    }

    private function fetchReceiver($userArray, $userid)
    {
        $userArray=array_diff($userArray, array($userid));

        $receiver=DB::table('users')
            ->where('id', array_shift($userArray))
            ->first(['id', 'picture', 'name']);

        return $receiver;
    }
}
