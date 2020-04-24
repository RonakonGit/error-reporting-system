import LogsController from './controllers/LogsController';
import AppsController from './controllers/AppsController';
import CustomersController from './controllers/CustomersController';
import UsersController from './controllers/UsersController';
import { RequestHandler } from 'express';
export interface Route_t {
    [key: string]: RequestHandler
}
export const routes: Route_t = {
    'GET /logs': LogsController.getAllLogs,
    'GET /logs/:lid': LogsController.getLog,
    'POST /logs': LogsController.postLog,

    'GET /apps': AppsController.getAllApps,
    'GET /apps/:aid': AppsController.getApp,
    'GET /apps/:aid/logs': AppsController.getAppLogs,

    'GET /customers/': CustomersController.getAllCustomers,
    'GET /customers/:cid': CustomersController.getCustomer,
    'GET /customers/:cid/apps': CustomersController.getCustomerApps,
    'GET /customers/:cid/users': CustomersController.getCustomerUsers,

    'GET /users': UsersController.getAllUsers,
    'GET /users/:uid': UsersController.getUser,
    'POST /users/login': UsersController.login
};


