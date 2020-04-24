import 'package:flutter/material.dart';
import 'package:reportservice/Components/ClickableLogsList.dart';
import 'package:reportservice/Models/Apps.dart';
import 'package:reportservice/Models/Logs.dart';

class LogsScreen extends StatefulWidget {
  final Apps app;
  LogsScreen(this.app);
  @override
  _LogsScreenState createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  Widget bodyWidget = Text("Loading");
  List<Logs> logs;
  @override
  void initState(){
    super.initState();
    makeRequest();
  }

  void onTapHandler(Logs log){
    print(log.message);
  }

  void makeRequest() async {
    logs = await widget.app.getAllLogs();
    setState(() {
      bodyWidget = ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, position){
          return ClickableLogsList(logs[position], onTapHandler);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(widget.app.appName) ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child:bodyWidget ,
      ) ,
    );
  }
}