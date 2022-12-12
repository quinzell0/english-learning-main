# CodeIgniter 4 Framework

## Instalasi
- clone repositori `git clone https://github.com/ridoananda/english-learning.git`
- install depedensi composer `composer install` atau `composer update`
- Copy env dan rename menjadi .env
- Atur nama, usernmae, host database di .env
- Buat database baru `english_leaning`
- import english_leaning.sql
- jalankan `php spark serve`

## Informasi Akun
- Admin 
email: admin@gmail.com
password: password
- Guru 
email: ridoananda@gmail.com
password: password
- Siswa 
email: ridoananda123@gmail.com
password: password

> Ketika buat akun guru default passwordnya adalah `password` silahkan ubah di app/Controllers/Aplikasi/Data.php line 95

## Server Requirements

PHP version 7.2 or higher is required, with the following extensions installed: 

- [intl](http://php.net/manual/en/intl.requirements.php)
- [libcurl](http://php.net/manual/en/curl.requirements.php) if you plan to use the HTTP\CURLRequest library

Additionally, make sure that the following extensions are enabled in your PHP:

- json (enabled by default - don't turn it off)
- [mbstring](http://php.net/manual/en/mbstring.installation.php)
- [mysqlnd](http://php.net/manual/en/mysqlnd.install.php)
- xml (enabled by default - don't turn it off)
