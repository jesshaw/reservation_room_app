import 'package:reservationroomapp/models/hotel.dart';
import 'package:reservationroomapp/services/abstract/hotel_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

class MockHotelService implements HotelService {
  @override
  Future<NetworkServiceResponse<List<Hotel>>> search(
      {String destination,
      DateTime start,
      DateTime end,
      int rooms = 1,
      int adults = 1,
      int children = 0}) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content: hotels,
    ));
  }
}

var hotels = [
  Hotel(
      hotelId: 1,
      name: 'Jing An Shangri-La, West Shanghai',
      address: "Jing''an, Shanghai  Show on map  2.5 km from center",
      images: [
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg'
      ]),
  Hotel(
      hotelId: 1,
      name: 'The Sukhothai Shanghai',
      address: "Jing''an, Shanghai  Show on map  1.2 km from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477268.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/162/162479698.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477232.jpg'
      ]),
  Hotel(
      hotelId: 1,
      name: 'Radisson Blu Hotel Shanghai New World',
      address: "Jing''an, Shanghai  Show on map  650 m from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg'
      ]),
];
