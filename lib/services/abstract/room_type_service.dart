import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/models/room_type.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

abstract class RoomTypeService {
  Future<NetworkServiceResponse<List<RoomType>>> search(
      {@required int hotelId,
      @required DateTime start,
      @required DateTime end,
      @required int rooms,
      @required int adults,
      @required int children});
}
