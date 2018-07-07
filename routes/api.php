<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('login', 'API\UserController@login');
Route::post('register', 'API\UserController@register');

Route::group(['middleware' => 'auth:api'], function(){
    Route::post('user', 'API\UserController@user');
    Route::post('searchUser', 'API\SearchController@searchUser');
    Route::post('editUser', 'API\UserController@editUser');
    Route::post('chat/auth', 'API\ChatController@auth');
    Route::post('chat/createuser', 'API\ChatController@createUsers');
    Route::post('chat/createroom','API\ChatController@createRoom');
    Route::post('chat/sendmessage', 'API\ChatController@sendMessage');
    Route::post('chat/rooms', 'API\ChatController@getRooms');
    Route::post('chat/updateroom/{id}', 'API\ChatController@updateRoom');
});