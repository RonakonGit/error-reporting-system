# Report Service Framwork
The framework for reporting the errors and logs to the server.

## The idea
There are lot of companies whose apps are being used by the users worldwide. It becomes crucial for the company to identify if the app works properly.

This is where the Error Logging and reporting System comes into play. The Report service provides set of tools and software to deal with the errors and logs being thrown by apps used by people worldwide.

### Tools and Softwares under ReportService
 - [**A framework**]- Used by developer instead of using traditional console logs the framework provides logging the error directly to our server
 - [**The Server**] - Connects to the database and post all error to the database post validation.
 - [**The App**] - The app provides the way to see all the errors logged by the apps of the particular company.
    - Each developer of the company gets an account for the usage of the app
- [**The Database**] - The mysql database to keep the record of al the _companies_, their _developers(users)_ and their _apps_(web or mobile) and the _errors_ logged by these apps

## Using the demo App
 - Clone the repository
 - Start the mysql server. [Download this repo for queries]
 - Start the server. [Download this repo for server]
 - Change the serverUrl in the `framework.js` file.
 - Start the `demo\ app/TestApp.html`



