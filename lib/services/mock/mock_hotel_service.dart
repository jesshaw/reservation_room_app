import 'package:reservationroomapp/models/hotel.dart';
import 'package:reservationroomapp/services/abstract/hotel_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

class MockHotelService implements HotelService {
  @override
  Future<NetworkServiceResponse<List<Hotel>>> search(
      {String destination,
      DateTime start,
      DateTime end,
      int page,
      int size,
      int rooms = 1,
      int adults = 1,
      int children = 0}) async {
    await Future.delayed(Duration(seconds: 2));

    return Future.value(NetworkServiceResponse(
      success: true,
      content: hotels.skip(page * size).take(size).toList(),
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
      hotelId: 2,
      name: 'The Sukhothai Shanghai',
      address: "Jing''an, Shanghai  Show on map  1.2 km from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477268.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/162/162479698.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477232.jpg'
      ]),
  Hotel(
      hotelId: 3,
      name: 'Radisson Blu Hotel Shanghai New World',
      address: "Jing''an, Shanghai  Show on map  650 m from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg'
      ]),
  Hotel(
      hotelId: 4,
      name: 'Jing An Shangri-La, West Shanghai',
      address: "Jing''an, Shanghai  Show on map  2.5 km from center",
      images: [
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg'
      ]),
  Hotel(
      hotelId: 5,
      name: 'The Sukhothai Shanghai',
      address: "Jing''an, Shanghai  Show on map  1.2 km from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477268.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/162/162479698.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477232.jpg'
      ]),
  Hotel(
      hotelId: 6,
      name: 'Radisson Blu Hotel Shanghai New World',
      address: "Jing''an, Shanghai  Show on map  650 m from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg'
      ]),
  Hotel(
      hotelId: 7,
      name: 'Jing An Shangri-La, West Shanghai',
      address: "Jing''an, Shanghai  Show on map  2.5 km from center",
      images: [
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg'
      ]),
  Hotel(
      hotelId: 8,
      name: 'The Sukhothai Shanghai',
      address: "Jing''an, Shanghai  Show on map  1.2 km from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477268.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/162/162479698.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477232.jpg'
      ]),
  Hotel(
      hotelId: 9,
      name: 'Radisson Blu Hotel Shanghai New World',
      address: "Jing''an, Shanghai  Show on map  650 m from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg'
      ]),
  Hotel(
      hotelId: 10,
      name: 'Jing An Shangri-La, West Shanghai',
      address: "Jing''an, Shanghai  Show on map  2.5 km from center",
      images: [
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg'
      ]),
  Hotel(
      hotelId: 11,
      name: 'The Sukhothai Shanghai',
      address: "Jing''an, Shanghai  Show on map  1.2 km from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477268.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/162/162479698.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477232.jpg'
      ]),
  Hotel(
      hotelId: 12,
      name: 'Jing An Shangri-La, West Shanghai',
      address: "Jing''an, Shanghai  Show on map  2.5 km from center",
      images: [
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg'
      ]),
  Hotel(
      hotelId: 13,
      name: 'The Sukhothai Shanghai',
      address: "Jing''an, Shanghai  Show on map  1.2 km from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477268.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/162/162479698.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477232.jpg'
      ]),
  Hotel(
      hotelId: 14,
      name: 'Radisson Blu Hotel Shanghai New World',
      address: "Jing''an, Shanghai  Show on map  650 m from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg'
      ]),
  Hotel(
      hotelId: 15,
      name: 'Jing An Shangri-La, West Shanghai',
      address: "Jing''an, Shanghai  Show on map  2.5 km from center",
      images: [
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg'
      ]),
  Hotel(
      hotelId: 16,
      name: 'The Sukhothai Shanghai',
      address: "Jing''an, Shanghai  Show on map  1.2 km from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477268.jpg',
        'https://ac-r.static.booking.cn/images/hotel/max1280x900/162/162479698.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/162/162477232.jpg'
      ]),
  Hotel(
      hotelId: 17,
      name: 'Radisson Blu Hotel Shanghai New World',
      address: "Jing''an, Shanghai  Show on map  650 m from center",
      images: [
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
        'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg'
      ]),
];
