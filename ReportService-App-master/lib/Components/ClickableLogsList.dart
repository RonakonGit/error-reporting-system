import 'package:flutter/material.dart';
import 'package:reportservice/Models/Logs.dart';

class ClickableLogsList extends StatelessWidget {
  final Logs log;
  final Function onTapHandler;
  final IconData icon;
  final Color cardColor;

  ClickableLogsList._(this.log, this.onTapHandler, this.icon, this.cardColor);

  factory ClickableLogsList(Logs log, Function onTapHandler) {
    IconData icon;
    Color cardColor;
    if (log.logType == 'Error') {
      icon = Icons.error;
      cardColor = Colors.red;
    } else if (log.logType == 'Warning') {
      icon = Icons.warning;
      cardColor = Colors.orange;
    } else if (log.logType == 'Info') {
      icon = Icons.info;
      cardColor = Colors.blue;
    } else {
      icon = Icons.message;
      cardColor = Colors.green;
    }
    return new ClickableLogsList._(log, onTapHandler, icon, cardColor);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          onTapHandler(log);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                color: cardColor,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    log.lid.toString() + ". " + log.logType,
                    style: TextStyle(fontSize: 16, color: cardColor),
                  ),
                  Text(
                    "Created: " + log.dateCreated.split("T")[0],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "Reported By: " + log.reportBy,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: Text(
                        log.message ,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: TextStyle(fontSize: 13),
                      ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
