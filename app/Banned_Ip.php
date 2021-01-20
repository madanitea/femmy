<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Banned_Ip extends Model
{
	protected $table = "banned_ips";
    /**
     * The attributes that are mass assignable.
     *	
     * @var array
     */
    protected $fillable = [
        'ip', 'jail_id', 'info', 'abuse', 'status',
    ];

    protected $hidden = [
    	'ip',
    ];

    protected $casts = [
        'info' => 'array',
    ];
}
