<?php

define( 'DB_NAME', 'arannara' );

define( 'DB_USER', 'arannara' );

define( 'DB_PASSWORD', 'qwerty' );

define( 'DB_HOST', 'mysql:3306');
define( 'WP_HOME', 'http://192.168.99.222:5050/' );
define( 'WP_SITEURL', 'http://192.168.99.222:5050/' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

define('AUTH_KEY',         'UKX8NKf07Uuw<-~RBStj1%f16n*o_|F,Mc:GYY@$Kah4c9M}o&O-PGJSiI}gaq+*');
define('SECURE_AUTH_KEY',  'Iq}<[FbOcP?m-Ke|))7:HYY3*X]=b>|b 3qn8`S@Jt8W.U{!I3X-GO>EzU8Z(zSw');
define('LOGGED_IN_KEY',    'mxg:Ec5e7EO>#fQh;d+p@{+0dXGO@zl+/++2t->PXCnx4YWP4mG C+|znD::fI(T');
define('NONCE_KEY',        'Wf6&9-Iz+di7~4J7mf0T>8#lX+s,?R:G*c+4MD~Ph@T40y6-.]u[QW|QF||>)]hM');
define('AUTH_SALT',        '/2e^x@`bt5gK!>z.Jt0^y-eY>af_uYkmMz-~`,}/OJI{dU~N>R{XbX@&|Mv.5uB1');
define('SECURE_AUTH_SALT', '&ig mOIK47gLcg7aB+C#0jVH6=X-ByG]k</&<o.P7}N19qZFbjd]N&kl$>)1ePr1');
define('LOGGED_IN_SALT',   'mifZIq)*!!#ix,ObOw1zp^J8E 2?<K5SLR1uS@7J<x 2WTnD?)|Q~l9$.H &dH6q');
define('NONCE_SALT',       'Luf|QDSAE=y8Eh_,V=N I$aS=o=-S,;R-++5VfE>Q1)rZbT<Cs|+]R_JR^R5+pwM');

$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';