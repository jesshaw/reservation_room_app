import 'package:reservation_room_app/model/post_response.dart';
import 'package:reservation_room_app/services/abstract/i_user_service.dart';
import 'package:reservation_room_app/services/network_service_response.dart';

class MockUserService implements IUserService {
  @override
  Future<NetworkServiceResponse<PostResponse>> fetchPost(int id) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content: postResponse,
    ));
  }

  @override
  Future<NetworkServiceResponse<String>> authenticate(
      String loginName, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content:
          "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTU4NTY2MjAwOH0.-nB1a1z3SlNjMhBKYB1f9nOIS6g9fhqmmfYT-uh6KkHqbrILs6wazCHkR6N7Gc3lNVOtVb43ftu6dgZx21JTgQ",
    ));
  }
}

var postResponse = new PostResponse(
    userId: 1,
    id: 1,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit");
