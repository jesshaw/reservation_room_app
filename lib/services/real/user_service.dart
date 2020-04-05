import 'package:reservationroomapp/models/login_response.dart';
import 'package:reservationroomapp/models/post_response.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';
import 'package:reservationroomapp/services/network_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';
import 'package:reservationroomapp/services/rest_client.dart';
import 'package:reservationroomapp/utils/app_constant.dart';

class RealUserService extends NetworkService implements UserService {
  static final _kUserLogin = AppConstant.apiRoot + "/authenticate";

  RealUserService(RestClient reset) : super(reset);

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
  Future<NetworkServiceResponse<String>> authenticate(
      {String username, String password}) async {
    Map jsonMap = {
      "username": username,
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
  signInWithGoogle() {
    // TODO: implement signInWithGoogle
    return null;
  }
}
