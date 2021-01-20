<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Host extends Model
{
	public function jail()
	{
	    return $this->hasMany(Jail::class);
	}
    /**
     * The attributes that are mass assignable.
     *	
     * @var array
     */
    protected $fillable = [
        'ip', 'description', 'name', 'port', 'api_key',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'api_key',
    ];
}
