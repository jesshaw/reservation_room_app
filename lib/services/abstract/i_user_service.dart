import 'package:reservation_room_app/model/login_response.dart';
import 'package:reservation_room_app/model/post_response.dart';
import 'package:reservation_room_app/services/network_service_response.dart';

abstract class IUserService {
  Future<NetworkServiceResponse<LoginResponse>> login(
      String loginName, String password);

  Future<NetworkServiceResponse<PostResponse>> fetchPost(int id);
}
