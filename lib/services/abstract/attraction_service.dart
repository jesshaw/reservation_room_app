import 'package:flutter/cupertino.dart';
import 'package:reservationroomapp/models/attraction.dart';
import 'package:reservationroomapp/models/hotel.dart';
import 'package:reservationroomapp/services/network_service_response.dart';

abstract class AttractionService {
  Future<NetworkServiceResponse<List<Attraction>>> fetch(
      {@required int cityId,
      @required int page,
      @required int size,
      });
}
