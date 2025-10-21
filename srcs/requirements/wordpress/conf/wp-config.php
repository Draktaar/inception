<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
define('DB_NAME', 'database');
define('DB_USER', 'adrien');
define('DB_PASSWORD', 'chu');
define('DB_HOST', 'mariadb');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ' j%qfMIe^$54-zbi|5W}0[$6W&d0DjC.0ipZLX^KxF 2hohz?e+YFd (|UU$-,Zw');
define('SECURE_AUTH_KEY',  'HU-D/3(t-W1b(Li&&AQ7BE;hdIx@|7R@AVTy4Zl+-CQm$=:9!|TKCC9tW6s+XtM:');
define('LOGGED_IN_KEY',    '>V13EG Cpn&fje5>i=!9_yW>d~1i7oQucJ6:t-2;@tF>|qC(T>V!GaIUSIQ2hQLf');
define('NONCE_KEY',        '*D1-?vTICV%$.|Pf2zZo0%vI|NwU$]5uw:8(}7(a--+0HAhS9VCtt&6AKrP*HjF_');
define('AUTH_SALT',        'hG]WK;F}oSCzp)}WSoK8rF)RCMZj}d2nF~sw]>yO#-gXxS(R/Ny;-SQ`i;7),;5S');
define('SECURE_AUTH_SALT', '$e`quc cBSMa<YPo*@60|k~g+%[,+!UtXQ>!/)h1>A 2-UQANq7x|-n^qN3(Ux {');
define('LOGGED_IN_SALT',   '[.!mfA#_r0Y:VVf}@gxu<t O<A$t+SO&vq5(`iwu.O[$}*e)gjhMd]ysGN*^tJy5');
define('NONCE_SALT',       '<$j8oo$D`8MdYkb!lLe>K@en|CPhS[#^,|9Cz@u(nuX{T!;&!+({Tln>N4IxVe?+');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');