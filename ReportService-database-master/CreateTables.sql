CREATE TABLE Customers(
	cid int PRIMARY KEY,
	customer_name VARCHAR(100),
	brand_color VARCHAR(6),
	description TEXT,
	date_created DATETIME DEFAULT now()
);
CREATE TABLE Users(
	uid int PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	email VARCHAR(50),
	password VARCHAR(30),
	cid int,
	date_created DATETIME DEFAULT now(),
	FOREIGN KEY(cid) REFERENCES Customers(cid)
);
CREATE TABLE Apps(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	app_name VARCHAR(50),
	app_type VARCHAR(50),
	cid INT,
	description TEXT,
	date_created DATETIME DEFAULT now(),
	FOREIGN KEY(cid) REFERENCES Customers(cid)
);
CREATE TABLE log_type(
	log_type VARCHAR(50) PRIMARY KEY
);


CREATE TABLE Logs(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	aid INT,
	message TEXT, 
	log_type VARCHAR(50),
	report_by VARCHAR(50),
	date_created DATETIME DEFAULT now(),
	FOREIGN KEY(aid) REFERENCES Apps(aid),
	FOREIGN KEY(log_type) REFERENCES log_type(log_type)
);









