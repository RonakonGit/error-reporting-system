import 'package:flutter/material.dart';
import 'package:reportservice/Components/ClickableAppList.dart';
import 'package:reportservice/Models/Apps.dart';
import '../Models/User.dart';
import './logsScreen.dart';

class Home extends StatefulWidget {
  final User user;
  
  Home(this.user) ;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget bodyWidget = Text("Loading...");
  var userApps;
  @override
  void initState() {
    super.initState();
    makeRequest();
  }
  void onTapHandler(Apps app){
    print(app.appName);
    Navigator.push(context, MaterialPageRoute( builder: (context) => LogsScreen(app) ));
  }
  void makeRequest() async {
    List<Apps> userApps = await widget.user.getAllApps();
    print(userApps.length);
    setState(() {
      bodyWidget = ListView.builder(
        itemCount: userApps.length,
        itemBuilder: (context, position){
          return ClickableAppList(userApps[position], onTapHandler);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text(widget.user.name)),
      body: Builder(builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: bodyWidget,
        );
      }),
    );
  }
}
