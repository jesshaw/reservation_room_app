import 'package:reservation_room_app/model/login_response.dart';
import 'package:reservation_room_app/model/post_response.dart';
import 'package:reservation_room_app/services/abstract/i_user_service.dart';
import 'package:reservation_room_app/services/network_service.dart';
import 'package:reservation_room_app/services/network_service_response.dart';
import 'package:reservation_room_app/services/rest_client.dart';

class UserService extends NetworkService implements IUserService {
  static const _kUserLogin = "/login";

  UserService(RestClient reset) : super(reset);

  @override
  Future<NetworkServiceResponse<LoginResponse>> login(
      String loginName, String password) async {
    var result = await reset.postAsync<LoginResponse>(_kUserLogin, loginName);
    if (result.mappedResult != null) {
      var res = LoginResponse.fromJson(result.mappedResult);
      return new NetworkServiceResponse(
        content: res,
        success: result.networkServiceResponse.success,
      );
    }
    return new NetworkServiceResponse(
        success: result.networkServiceResponse.success,
        message: result.networkServiceResponse.message);
  }

  @override
  Future<NetworkServiceResponse<PostResponse>> fetchPost(int id) async {
    final String url =
        "https://jsonplaceholder.typicode.com/posts/" + id.toString();
    var result = await reset.getAsync<PostResponse>(url);
    if (result.mappedResult != null) {
      var res = PostResponse.fromJson(result.mappedResult);
      return new NetworkServiceResponse(
        content: res,
        success: result.networkServiceResponse.success,
      );
    }

    return new NetworkServiceResponse(
        success: result.networkServiceResponse.success,
        message: result.networkServiceResponse.message);
  }
}
