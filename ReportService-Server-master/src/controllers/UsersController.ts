import { Request, Response } from 'express';
import connection from '../db';
import { MysqlError, FieldInfo } from 'mysql'
import { RSA_NO_PADDING } from 'constants';

var UsersControllers = {
    getAllUsers: function (req: Request, res: Response) {
        connection.query("Select * from Users", (err, rows, field) => {
            res.json(rows);
        })
    },
    getUser: function (req: Request, res: Response) {
        connection.query(`SELECT * FROM Users WHERE uid= ${req.params['uid']}`, (err, rows, field) => {
            if (!err)
                res.json(rows);
            else
                res.status(500).json({ msg: 'Could not find the User', err: err!.sqlMessage })
        })
    },

    login: function (req: Request, res: Response) {
        const email: string = req.body['email'] ? req.body['email'] : undefined;
        const password: string = req.body['password'] ? req.body['password'] : undefined;
        if (email && password) {
            connection.query(`SELECT * FROM Users WHERE email = '${email}' AND password = '${password}'`, (err, rows, fields) => {

                if (!err && rows.length > 0) {
                    res.json(rows[0]);
                }
                else if (!err && rows.length == 0) {
                    res.status(404).json({ msg: "Invalid credentials", err: "Can't find the user with given info" });
                }
                else {
                    res.status(500).json({ msg: "We could not authenticate you", err: err!.sqlMessage })
                }
            })
        }
        else {
            res.status(400).json({ msg: "Invalid email or password", err: "Bad request" })
        }
    }

}
export default UsersControllers;