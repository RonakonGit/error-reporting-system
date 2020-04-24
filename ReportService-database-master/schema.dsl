TABLE Customers{
	cid int [PK]
	customer_name VARCHAR(100)
	brand_color VARCHAR(6)
	description TEXT
	date_created DATETIME [default: `now()`]
}
TABLE Users{
	uid int [PK]
	name VARCHAR(50)
	email VARCHAR(50)
	password VARCHAR(30)
	cid int [ref: > Customers.id]
	date_created DATETIME [default: `now()`]

}
TABLE Apps{
	aid INT [PK]
	app_name VARCHAR(50)
	app_type VARCHAR(50)
	cid INT [ref: > Customers.id]
	description TEXT
	date_created DATETIME [default: `now()`]
	
}
TABLE log_type(
	log_type VARCHAR(50) [PK]
}


TABLE Logs{
	lid INT [PK]
	aid INT [ref: > Apps.aid]
	message TEXT 
	log_type VARCHAR(50) [ref: > log_type.log_type]
	report_by VARCHAR(50)
	date_created DATETIME [default: `now()`]
}









