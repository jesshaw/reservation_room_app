import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/models/post_response.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

abstract class UserService {
  Future<NetworkServiceResponse<String>> authenticate({@required String username, @required String password});

  Future<NetworkServiceResponse<PostResponse>> fetchPost(int id);

  hasToken() {}

  persistToken(String token) {}

  deleteToken() {}
}
