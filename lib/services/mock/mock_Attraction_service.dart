import 'dart:math';

import 'package:mock_data/mock_data.dart';
import 'package:reservationroomapp/models/attraction.dart';
import 'package:reservationroomapp/services/abstract/attraction_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

class MockAttractionService implements AttractionService {
  @override
  Future<NetworkServiceResponse<List<Attraction>>> fetch(
      {int cityId, int page, int size}) async {
    await Future.delayed(Duration(seconds: 2));

    return Future.value(NetworkServiceResponse(
      success: true,
      content: attractions.skip(page * size).take(size).toList(),
    ));
  }
}

var attractions = _createAttractions(32);
Random rnd = new Random();
List<Attraction> _createAttractions(int count) {
  return List.generate(count, (i) => Attraction(
          attractionId: i,
          cityId: mockInteger(1, 100),
          images: List.generate(
              mockInteger(1, 5),
              (j) =>
                  'https://picsum.photos/${mockInteger(200, 700)}/${mockInteger(200, 1000)}/'),
          name: mockString(15, 'a#'),
          slogan: mockString(15, 'a#'),
          rate: rnd.nextDouble(),
          address: mockString(15, 'a#'),
          openingHours: '',
          description: '',
          ticketInfo: '',
          travelInfo: mockString(7, 'aA'),
          contactInfo: mockName(),
          smokingYN: rnd.nextBool(),
          remark: mockString(100, 'a#')
      )
  );
}
