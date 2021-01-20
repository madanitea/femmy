<?php

use Illuminate\Database\Seeder;
use App\Filter;

class FilterSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $default_filter = ['3proxy','apache-auth','apache-badbots','apache-botsearch','apache-common','apache-fakegooglebot','apache-modsecurity','apache-nohome','apache-noscript','apache-overflows','apache-pass','apache-shellshock','assp','asterisk','bitwarden','botsearch-common','centreon','common','counter-strike','courier-auth','courier-smtp','cyrus-imap','directadmin','domino-smtp','dovecot','dropbear','drupal-auth','ejabberd-auth','exim-common','exim','exim-spam','freeswitch','froxlor-auth','groupoffice','gssftpd','guacamole','haproxy-http-auth','horde','kerio','lighttpd-auth','mongodb-auth','monit','murmur','mysqld-auth','nagios','named-refused','nginx-botsearch','nginx-http-auth','nginx-limit-req','nsd','openhab','openwebmail','oracleims','pam-generic','perdition','phpmyadmin-syslog','php-url-fopen','portsentry','postfix','proftpd','pure-ftpd','qmail','recidive','roundcube-auth','screensharingd','selinux-common','selinux-ssh','sendmail-auth','sendmail-reject','sieve','slapd','sogo-auth','solid-pop3d','squid','squirrelmail','sshd','stunnel','suhosin','tine20','traefik-auth','uwimap-auth','vsftpd','webmin-auth','wuftpd','xinetd-fail','znc-adminlog','zoneminder'];

        foreach ($default_filter as $filter) {
             Filter::create(['name' => $filter, 'varian' => 'default']);
        }
    }
}
