import 'dart:convert';

import 'package:chatpage/model/usermodel.dart';
import 'package:http/http.dart' as http;

class ApiFetch {
  List<dynamic> finalresponce = [];
  List<UserModel> userlist = [];
  Future<List<UserModel>> apiGet() async {
    String url = 'https://dummyapi.io/data/v1/user';
    String apiKey = '62a96a8b282ebc39fdbb79b3';

    var responce = await http.get(Uri.parse(url), headers: {'app-id': apiKey});

    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      finalresponce = data['data'];
      userlist = finalresponce.map((json) => UserModel.fromJson(json)).toList();
      print(userlist);
    }
    return userlist;
  }
}
