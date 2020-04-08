import 'package:flutter_test/flutter_test.dart';
import 'package:reservationroomapp/services/mock/mock_hotel_service.dart';

void main() {
  group("MockHotelService", () {
    final hotelSvc = MockHotelService();
    test("should fetch hotels success", () async {
      int size = 10;
      int page = 0;
      bool hasReachedMax = false;
      while (!hasReachedMax) {
        final result = await hotelSvc.search(
            destination: 'shanghai',
            start: DateTime.parse("20200408"),
            end: DateTime.parse("20200409"),
            page: page,
            size: size);
        hasReachedMax = result.content.isEmpty;

        expect(result.success, true);
        if (!hasReachedMax) {
          expect(result.content.length<=size, true);
        }
        page++;
      }
    });
  });
}
