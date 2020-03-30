import 'package:flutter_test/flutter_test.dart';
import 'package:reservation_room_app/services/mock/mock_user_service.dart';
import 'package:reservation_room_app/services/rest_client.dart';

void main() {
  group("MockUserService", () {
    test("should fetch post success", () async {
      final userSvc = MockUserService();
      final user = await userSvc.fetchPost(1);

      expect(user.content.userId, 1);
      expect(user.content.title,
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit");
    });
  });
}
