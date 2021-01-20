<?php
 
namespace App\Http\Controllers;
 
use Illuminate\Http\Request;
use Telegram\Bot\FileUpload\InputFile;
use Telegram\Bot\Laravel\Facades\Telegram;
 
class TelegramBotController extends Controller
{
    // public function updatedActivity()
    // {
    //     $activity = Telegram::getUpdates();
    //     dd($activity);
    // }
 
    public function storeMessage($message)
    {
 
        Telegram::sendMessage([
            'chat_id' => env('TELEGRAM_CHANNEL_ID', ''),
            'parse_mode' => 'HTML',
            'text' => $message
        ]);
 
        return 'Ok';
    }
}