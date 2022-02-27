import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_workshop_by_newii/env.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

Future<UserModel> LoginService(String email, String password) async {
  String hashedPassword = md5.convert(utf8.encode(password)).toString();
  final String url = URL + "/user/" + email + "/" + hashedPassword;
  final response = await http.get(Uri.parse(url), headers: <String, String>{
    'Content-Type': 'application/json; charset=utf-8',
  });
  if (response.statusCode == 200) {
    return UserModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to Login');
  }
}
