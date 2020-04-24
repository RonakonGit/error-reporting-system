# Report Service App
The app for displaying all the apps and logs of a particular company.

## The idea
There are lot of companies whose apps are being used by the users worldwide. It becomes crucial for the company to identify if the app works properly.

This is where the Error Logging and reporting System comes into play. The Report service provides set of tools and software to deal with the errors and logs being thrown by apps used by people worldwide.

### Tools and Softwares under ReportService
 - [**A framework**] - Used by developer instead of using traditional console logs the framework provides logging the error directly to our server
 - [**The Server**] - Connects to the database and post all error to the database post validation.
 - [**The App**]- The app provides the way to see all the errors logged by the apps of the particular company.
    - Each developer of the company gets an account for the usage of the app
- [**The Database**] - The mysql database to keep the record of al the _companies_, their _developers(users)_ and their _apps_(web or mobile) and the _errors_ logged by these apps

## Starting the App
 - Clone the repository
 - Start the mysql server([Clone this repo] for data insertion and table creation query)
  - Start the server. [Clone this repo]
 - Change the server url in `./lib/Models/data.dart` file
- Run the command `flutter run android`

## Project structure [src]
 - Starting point is `./lib/main.dart`
 - All Screens are defined in `./lib/Screens/`
 - All components are in `./lib/Components/`
 - All Models for server response objects and server calls are in `./lib/Models/`

