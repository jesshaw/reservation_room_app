import 'package:reservationroomapp/model/login_response.dart';
import 'package:reservationroomapp/model/post_response.dart';
import 'package:reservationroomapp/services/abstract/i_user_service.dart';
import 'package:reservationroomapp/services/network_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';
import 'package:reservationroomapp/services/rest_client.dart';
import 'package:reservationroomapp/utils/app_constant.dart';

class UserService extends NetworkService implements IUserService {
  static final _kUserLogin = AppConstant.apiRoot + "/authenticate";

  UserService(RestClient reset) : super(reset);

  @override
  Future<NetworkServiceResponse<String>> authenticate(
      String loginName, String password) async {
    Map jsonMap = {
      "username": loginName,
      "password": password,
      "rememberMe": true,
    };

    var result = await reset.postAsync<LoginResponse>(_kUserLogin, jsonMap);
    if (result.mappedResult != null) {
      return new NetworkServiceResponse(
        content: result.mappedResult['id_token'],
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
