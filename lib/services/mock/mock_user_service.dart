import 'package:reservationroomapp/models/post_response.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';
import 'package:reservationroomapp/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockUserService implements UserService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<NetworkServiceResponse<String>> authenticate(
      {String username, String password}) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content:
          "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTU4NTY2MjAwOH0.-nB1a1z3SlNjMhBKYB1f9nOIS6g9fhqmmfYT-uh6KkHqbrILs6wazCHkR6N7Gc3lNVOtVb43ftu6dgZx21JTgQ",
    ));
  }

  @override
  Future<void> deleteToken() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(AppConstant.storageKeyMobileToken);
  }

  @override
  Future<bool> hasToken() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString(AppConstant.storageKeyMobileToken);
    return token != null;
  }

  @override
  Future<void> persistToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(AppConstant.storageKeyMobileToken, token);
  }

  @override
  signInWithGoogle() {
    // TODO: implement signInWithGoogle
    return null;
  }
}

var postResponse = new PostResponse(
    userId: 1,
    id: 1,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit");
