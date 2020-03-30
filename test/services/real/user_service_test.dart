import 'package:flutter_test/flutter_test.dart';
import 'package:reservation_room_app/services/real/user_service.dart';
import 'package:reservation_room_app/services/rest_client.dart';

void main() {
  group("UserService", () {
    test("should fetch post success", () async {
      final rest = RestClient();
      final userSvc = UserService(rest);
      final user = await userSvc.fetchPost(1);

      expect(user.content.userId, 1);
      expect(user.content.title,
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit");
    });

    test("should authenticate success", () async {
      final rest = RestClient();
      final userSvc = UserService(rest);
      final user = await userSvc.authenticate("admin","admin");

      expect(user.success, true);
      expect(user.content.isNotEmpty, true);
    });
  });
}
