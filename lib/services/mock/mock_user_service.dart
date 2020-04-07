import 'package:reservationroomapp/models/post_response.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

class MockUserService implements UserService {
  @override
  Future<NetworkServiceResponse<PostResponse>> fetchPost(int id) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content: postResponse,
    ));
  }


  @override
  Future<NetworkServiceResponse<String>> authenticate({String username, String password}) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content:
          "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTU4NTY2MjAwOH0.-nB1a1z3SlNjMhBKYB1f9nOIS6g9fhqmmfYT-uh6KkHqbrILs6wazCHkR6N7Gc3lNVOtVb43ftu6dgZx21JTgQ",
    ));
  }

  @override
  deleteToken() {
    // TODO: implement deleteToken
    return null;
  }

  @override
  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  @override
  persistToken(String token) {
    // TODO: implement persistToken
    return null;
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
