import 'package:reservationroomapp/models/login_response.dart';
import 'package:reservationroomapp/services/abstract/user_service.dart';
import 'package:reservationroomapp/services/network_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';
import 'package:reservationroomapp/services/rest_client.dart';
import 'package:reservationroomapp/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealUserService extends NetworkService implements UserService {
  static final _kUserLogin = AppConstant.apiRoot + "/authenticate";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  RealUserService(RestClient reset) : super(reset);

//  @override
//  Future<NetworkServiceResponse<PostResponse>> fetchPost(int id) async {
//    final String url =
//        "https://jsonplaceholder.typicode.com/posts/" + id.toString();
//    var result = await reset.getAsync<PostResponse>(url);
//    if (result.mappedResult != null) {
//      var res = PostResponse.fromJson(result.mappedResult);
//      return new NetworkServiceResponse(
//        content: res,
//        success: result.networkServiceResponse.success,
//      );
//    }
//
//    return new NetworkServiceResponse(
//        success: result.networkServiceResponse.success,
//        message: result.networkServiceResponse.message);
//  }

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
