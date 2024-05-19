<?php
/**
 * Database NoName
 */
class Database
{
	const HOST = "127.0.0.1";
	const USER = "root";
	const PASSWORD = "";
	const DATABASE = "no_name";
	
	public function connect(){
		$connect = mysqli_connect(self::HOST, self::USER, self::PASSWORD, self::DATABASE);

		mysqli_set_charset($connect, "utf8");

		// Kiểm tra xem connect thành công hay không
		if(mysqli_connect_errno() === 0){
			return $connect;
		}

		return false;
	}
}