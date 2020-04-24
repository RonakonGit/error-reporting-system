import { Request, Response } from 'express';
import connection from '../db';
import { MysqlError, FieldInfo } from 'mysql'

export default {
    getAllApps: function (req: Request, res: Response) {
        connection.query("Select * from Apps", (err, rows, field) => {
            res.json(rows);
        });
    },
    getApp: function (req: Request, res: Response) {
        connection.query(`SELECT * FROM Apps WHERE aid= ${req.params['aid']}`, (err, rows, field) => {
            if (!err)
                res.json(rows);
            else
                res.status(500).json({ msg: 'Could not find the app', err: err })
        });
    },
    getAppLogs: function (req: Request, res: Response) {
        connection.query(`SELECT * FROM Logs WHERE aid= ${req.params['aid']}`, (err, rows, field) => {
            if (!err)
                res.json(rows);
            else
                res.status(500).json({ msg: 'Could not find the app logs', err: err })
        });
    }
}