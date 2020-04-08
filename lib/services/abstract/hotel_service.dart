import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/models/hotel.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

abstract class HotelService {
  Future<NetworkServiceResponse<List<Hotel>>> search(
      {@required String destination,
      @required DateTime start,
      @required DateTime end,
      @required int page,
      @required int size,
      int rooms = 1,
      int adults = 1,
      int children = 0});
}
