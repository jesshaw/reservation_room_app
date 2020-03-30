import 'package:reservation_room_app/model/login_response.dart';
import 'package:reservation_room_app/model/post_response.dart';
import 'package:reservation_room_app/services/abstract/i_user_service.dart';
import 'package:reservation_room_app/services/network_service_response.dart';

class MockUserService implements IUserService{
  @override
  Future<NetworkServiceResponse<PostResponse>> fetchPost(int id) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content: postResponse,
    ));
  }

  @override
  Future<NetworkServiceResponse<LoginResponse>> login(String loginName, String password)  async{
    // TODO: implement login
    return null;
  }
}
var postResponse=new PostResponse(userId:1,id: 1,title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit");