import 'package:reservationroomapp/model/login_response.dart';
import 'package:reservationroomapp/model/post_response.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

abstract class IUserService {
  Future<NetworkServiceResponse<String>> authenticate(
      String loginName, String password);

  Future<NetworkServiceResponse<PostResponse>> fetchPost(int id);
}
