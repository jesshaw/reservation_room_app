import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

abstract class UserService {
  Future<NetworkServiceResponse<String>> authenticate(
      {@required String username, @required String password});

  Future<bool> hasToken();

  Future<void> persistToken(String token);

  Future<void> deleteToken();

  signInWithGoogle();
}
