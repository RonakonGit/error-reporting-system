INSERT INTO Customers VALUES
(1, 'ADMINS', '00ff00', 'The admin company handles other customers and the overall database of the service provided', DEFAULT);

INSERT INTO Users VALUES
(1, "Pranay Gupta", 'pranaygupta1999@gmail.com', 'admin', 1, DEFAULT);

INSERT INTO Apps VALUES
(1, "FIRST APP", "Web", 1, "Used just for development purpose", DEFAULT);

INSERT INTO Apps VALUES
(2, "Demo Website", "Web", 1, "Used just for development purpose and for project display", DEFAULT);

INSERT INTO log_type VALUES
("Verbose"),
("Info"),
('Warning'),
('Error');

INSERT INTO Logs VALUES
(1, 1, "Client does not support authentication protocol requested by server; consider upgrading MySQL client", "Error", "Manual", DEFAULT);

