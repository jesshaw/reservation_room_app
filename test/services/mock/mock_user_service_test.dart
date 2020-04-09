import 'package:flutter_test/flutter_test.dart';
import 'package:reservationroomapp/services/mock/mock_user_service.dart';
import 'package:reservationroomapp/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("MockUserService", () {
    test("should authenticate success", () async {
      final userSvc = MockUserService();
      final user =
          await userSvc.authenticate(username: "admin", password: "admin");

      expect(user.success, true);
      expect(user.content.isNotEmpty, true);
    });

    test("should has not token", () async {
      SharedPreferences.setMockInitialValues({});
      final userSvc = MockUserService();

      final hasToken = await userSvc.hasToken();
      expect(hasToken, false);
    });

    test("should has token", () async {
      SharedPreferences.setMockInitialValues(
          {AppConstant.storageKeyMobileToken: "aa"});
      final userSvc = MockUserService();

      final hasToken = await userSvc.hasToken();

      expect(hasToken, true);
    });
  });
}
