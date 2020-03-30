import 'package:flutter_test/flutter_test.dart';
import 'package:reservation_room_app/services/mock/mock_user_service.dart';

void main() {
  group("MockUserService", () {
    final userSvc = MockUserService();
    test("should fetch post success", () async {
      final user = await userSvc.fetchPost(1);

      expect(user.content.userId, 1);
      expect(user.content.title,
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit");
    });

    test("should authenticate success", () async {
      final user = await userSvc.authenticate("admin", "admin");

      expect(user.success, true);
      expect(user.content.isNotEmpty, true);
    });
  });
}
