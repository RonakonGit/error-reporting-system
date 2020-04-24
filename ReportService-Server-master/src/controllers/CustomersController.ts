import { Request, Response } from 'express';
import connection from '../db';
import { MysqlError, FieldInfo } from 'mysql'

export default {
    getAllCustomers: function (req: Request, res: Response) {
        connection.query("Select * from Customers", (err, rows, field) => {
            res.json(rows);
        });
    },
    getCustomer: function (req: Request, res: Response) {
        connection.query(`SELECT * FROM Customers WHERE cid= ${req.params['cid']}`, (err, rows, field) => {
            if (!err)
                res.json(rows);
            else
                res.status(500).json({ msg: 'Could not find the Customer', err: err })
        });
    },
    getCustomerApps: function (req: Request, res: Response) {
        connection.query(`SELECT * FROM Apps WHERE cid= ${req.params['cid']}`, (err, rows, field) => {
            if (!err)
                res.json(rows);
            else
                res.status(500).json({ msg: 'Could not find the apps of the Customer', err: err });
        });
    },
    getCustomerUsers: function (req: Request, res: Response) {
        connection.query(`SELECT * FROM Users WHERE company= ${req.params['cid']}`, (err, rows, field) => {
            if (!err)
                res.json(rows);
            else
                res.status(500).json({ msg: 'Could not find the apps of the Customer', err: err });
        });
    }
}