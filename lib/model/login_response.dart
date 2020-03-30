import 'package:flutter/material.dart';

class LoginResponse {
  String status;
  LoginData data;

  LoginResponse({this.status, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        data = LoginData.fromJson(json['data']);
}

class LoginData {
  final String authToken;
  final String userId;

  const LoginData({@required this.authToken, @required this.userId});

  LoginData.fromJson(Map<String, dynamic> json)
      : authToken = json['authToken'],
        userId = json['userId'];
}
