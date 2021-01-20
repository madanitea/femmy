<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trusted_Ip extends Model
{
	protected $table = "trusted_ips";
    /**
     * The attributes that are mass assignable.
     *	
     * @var array
     */
    protected $fillable = [
        'ip', 'jail_id',
    ];

    protected $hidden = [
    	'ip',
    ];
}
