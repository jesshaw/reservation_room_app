import 'package:flutter_test/flutter_test.dart';
import 'package:reservationroomapp/services/real/user_service.dart';
import 'package:reservationroomapp/services/rest_client.dart';

void main() {
  group("UserService", () {

    final rest = RestClient();
    final userSvc = RealUserService(rest);

    test("should fetch post success", () async {
      final user = await userSvc.fetchPost(1);

      expect(user.content.userId, 1);
      expect(user.content.title,
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit");
    });

    test("should authenticate success", () async {
      final user = await userSvc.authenticate(username:"admin",password:"admin");

      expect(user.success, true);
      expect(user.content.isNotEmpty, true);
    });
  });
}
