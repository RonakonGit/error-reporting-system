import 'package:http/http.dart' as Http;
import 'package:reportservice/Models/Apps.dart';
import './data.dart' as data;
import 'dart:convert';

class User {
  final int uid;
  final String name;
  final String email;
  final String password;
  final int cid;
  final String dateCreated;
  User(this.uid, this.name, this.email, this.password, this.cid,
      this.dateCreated);

  static User fromJson(Map<String, dynamic> json) {
    return User(json['uid'], json['name'], json['email'], json['password'],
        json['cid'], json['date_created']);
  }

  static Future<User> login(String email, String password) async {
    try {
      var res = await Http.post(data.URL + '/users/login',
          body: {'email': email, 'password': password});
      Map<String, dynamic> resJson = jsonDecode(res.body);
      if (res.statusCode == 200) {
        var userObj = User.fromJson(resJson);
        return userObj;
      } else {
        throw Exception(resJson);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<Apps>> getAllApps() async {
    try {
      var res = await Http.get(data.URL + '/customers/$cid/apps');
      List resJson = jsonDecode(res.body);
      if (res.statusCode == 200) {
        List<Apps> ans = List<Apps>();
        for (var app in resJson) {
          ans.add(Apps.fromJson(app));
        }
        return ans;
      } else {
        throw Exception("Could not load the list of apps");
      }
    } catch (e) {
      throw e;
    }
  }
}
