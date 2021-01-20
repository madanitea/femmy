<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Jail extends Model
{
	public function host()
	{
	    return $this->belongsTo(Host::class);
	}
    /**
     * The attributes that are mass assignable.
     *	
     * @var array
     */
    protected $fillable = [
        'name', 'filter_id', 'logpath', 'port', 'find_time', 'max_retry', 'ban_time', 'host_id', 'status',
    ];
}
