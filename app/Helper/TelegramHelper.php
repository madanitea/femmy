<?php
 
namespace App\Helper;
 
use Illuminate\Http\Request;
use Telegram\Bot\FileUpload\InputFile;
use Telegram\Bot\Laravel\Facades\Telegram;
 
class TelegramHelper
{
    // public function updatedActivity()
    // {
    //     $activity = Telegram::getUpdates();
    //     dd($activity);
    // }
 
    public static function storeMessage($message)
    {
        Telegram::sendMessage([
            'chat_id' => env('TELEGRAM_CHANNEL_ID', ''),
            'parse_mode' => 'HTML',
            'text' => $message
        ]);
 
        return 'Ok';
    }
}