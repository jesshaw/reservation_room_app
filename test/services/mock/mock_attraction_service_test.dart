import 'package:flutter_test/flutter_test.dart';
import 'package:reservationroomapp/services/mock/mock_Attraction_service.dart';

void main() {
  group("MockAttractionService", () {
    final svc = MockAttractionService();
    test("should fetch attractions success", () async {
      int size = 10;
      int page = 0;
      bool hasReachedMax = false;
      while (!hasReachedMax) {
        final result = await svc.fetch(cityId: 1, page: page, size: size);
        hasReachedMax = result.content.isEmpty;


        expect(result.success, true);
        if (!hasReachedMax) {
          expect(result.content.length <= size, true);
        }
        page++;
      }
    });
  });
}
