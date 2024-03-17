<?php

define( 'DB_NAME', "wordpress" );
define( 'DB_USER', getenv( 'SQL_USR' ) );
define( 'DB_PASSWORD', getenv( 'SQL_PASSW' ) );
define( 'DB_HOST', "mariadb:3306"); 
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', 'utf8_bin' );

define('WP_SITEURL', 'https://' . getenv('FDQN'));
define('WP_HOME', 'https://' . getenv('FDQN'));

// For generating new salt keys https://api.wordpress.org/secret-key/1.1/salt/
define('AUTH_KEY',         '[-N-{[^nANbMU8J}Y^!+$btuTz[W$1qbHY;MK67_Nt.<LA8r^^feNrx.2z7d[{ln');
define('SECURE_AUTH_KEY',  '{q)R5l:U+E(~MD:8dgo4*^C;qmG;?!Mdg6pQU-|?E|AXkM^$JE Imz!0]?}U&|H$');
define('LOGGED_IN_KEY',    'CN-eIZ8t~BNIL3*Le -4:uFkHAAi6-`~jj+9 G p9+M8%Y#nSfXv`_1(T]9Be~S2');
define('NONCE_KEY',        '%YJ h=8o-5>K4BrA=R2<_4`N!Wp,Ua_-ok.Bd`9:4jB}[!A+lC5/Gr!pYNTTeFQk');
define('AUTH_SALT',        'RG[kh@z*sV6YJB/(d,L,%C}=Ft.(OZ`3qdUoLxO?l j.%-6/HW*aKxQ0a7t<jQ8p');
define('SECURE_AUTH_SALT', '+B4x{Q<qBrZK~Lhr<x-PF$8+kgkGU?9e^PT;#9Vpx;Wn(jr}Z^MJ`z7g| +6 F+Y');
define('LOGGED_IN_SALT',   'eC@CD@:/-zY@qcCr-e|,1!h+WHF{jY>|`t|N+<PQ/9n{c7ff=Ft<|&}!eal5)I;]');
define('NONCE_SALT',       'NC2!`44TH+>XN7.5yWt!i|mKbajA=OdHSRRG+NY+g4]qUW]x-fZOEywZu2mf`?yO');

//IF REDIS IS UP
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 ); 
define('WP_CACHE', true);
define('WP_REDIS_CLIENT', 'phpredis');

$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';