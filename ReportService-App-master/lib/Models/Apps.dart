import 'package:http/http.dart' as Http;
import 'package:reportservice/Models/Logs.dart';
import './data.dart' as data;
import 'dart:convert';

class Apps {
  final int aid;
  final String appName;
  final String appType;
  final int cid;
  final String description;
  final String dateCreated;
  Apps(this.aid, this.appName, this.appType, this.description, this.cid,
      this.dateCreated);

  static Apps fromJson(Map<String, dynamic> json) {
    return Apps(json['aid'], json['app_name'], json['app_type'],
        json['description'], json['cid'], json['date_created']);
  }

  Future<List<Logs>> getAllLogs() async {
    try {
      var res = await Http.get(data.URL + '/apps/$aid/logs');
      List resJson = jsonDecode(res.body);
      if (res.statusCode == 200) {
        List<Logs> ans = List<Logs>();
        for (var log in resJson) {
          ans.add(Logs.fromJson(log));
        }
        return ans;
      } else {
        throw Exception("Could not get the Logs of this app");
      }
    } catch (e) {
      throw e;
    }
  }
}
