import 'package:reservationroomapp/models/room_type.dart';
import 'package:reservationroomapp/services/abstract/room_type_service.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

class MockRoomTypeService implements RoomTypeService {
  @override
  Future<NetworkServiceResponse<List<RoomType>>> search(
      {int hotelId,
      DateTime start,
      DateTime end,
      int rooms,
      int adults,
      int children}) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content: roomTypes,
    ));
  }
}

var roomTypes = [
  RoomType(
      roomTypeId: 1,
      standardRate: 1738,
      typeDescription: 'Deluxe King',
      smokingYN: false,
      remark:
          'Deluxe Room features floor to ceiling windows offering clear views of Shanghai, marble bathroom with floor heating for optimal comfort, separate bathroom and toilet, and branded toiletries.',
      images: [
        'https://ac-q.static.booking.cn/xdata/images/hotel/max1024x768/179989109.jpg?k=cb81819ac67b5bb416e733c57d7fe997180a5d07ca47a4b294496a0bf873ad29&o=',
        'https://ac-r.static.booking.cn/xdata/images/hotel/max1024x768/179989150.jpg?k=86fff8db30e0a508506f41ffc06ee1313588766580f3f3753ebb96485fc0fa98&o=',
        'https://ac-q.static.booking.cn/xdata/images/hotel/max1024x768/41510171.jpg?k=d1ee9019e66e25e47b6f2fa42c62e570f60b06bd5d7a701549606391d29e768f&o='
      ]),
  RoomType(
      roomTypeId: 2,
      standardRate: 1898,
      typeDescription: 'Deluxe Twin',
      smokingYN: true,
      remark:
          'Deluxe Twin Room features floor to ceiling windows offering clear views of Shanghai, marble bathroom with floor heating for optimal comfort, separate bathroom and toilet, and branded toiletries.',
      images: [
        'https://ac-r.static.booking.cn/xdata/images/hotel/max1024x768/179989255.jpg?k=c67a1e19970e98a8c612df314643fce9bbdb27f2c15d05a7d51335771c5c44a8&o=',
        'https://ac-r.static.booking.cn/xdata/images/hotel/max1024x768/179989150.jpg?k=86fff8db30e0a508506f41ffc06ee1313588766580f3f3753ebb96485fc0fa98&o=',
        'https://ac-q.static.booking.cn/xdata/images/hotel/max1024x768/41510171.jpg?k=d1ee9019e66e25e47b6f2fa42c62e570f60b06bd5d7a701549606391d29e768f&o=',
        'https://ac-r.static.booking.cn/xdata/images/hotel/square60/96175506.jpg?k=324ce8b64e82b4482dbb711b412d366066b55def501ac4ac9c58875463187239&o='
      ]),
  RoomType(
      roomTypeId: 3,
      standardRate: 1888,
      typeDescription: 'Premier King',
      smokingYN: true,
      remark:
          'Premier Room features floor to ceiling windows offering clear views of Shanghai, Coffee machine, marble bathroom with floor heating for optimal comfort, separate bathroom and toilet, and branded toiletries.',
      images: [
        'https://ac-r.static.booking.cn/xdata/images/hotel/max1024x768/179989182.jpg?k=22cde44dac230b15b55a115ae259ebb00762307a2588aa89f41beb564b15db58&o=',
        'https://ac-r.static.booking.cn/xdata/images/hotel/max1024x768/179989150.jpg?k=86fff8db30e0a508506f41ffc06ee1313588766580f3f3753ebb96485fc0fa98&o=',
        'https://ac-q.static.booking.cn/xdata/images/hotel/max1024x768/41510171.jpg?k=d1ee9019e66e25e47b6f2fa42c62e570f60b06bd5d7a701549606391d29e768f&o=',
        'https://ac-r.static.booking.cn/xdata/images/hotel/square60/96175506.jpg?k=324ce8b64e82b4482dbb711b412d366066b55def501ac4ac9c58875463187239&o='
      ]),
];
