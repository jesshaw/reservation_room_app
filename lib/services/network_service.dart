import 'package:reservationroomapp/services/rest_client.dart';

abstract class NetworkService {
  RestClient reset;

  NetworkService(this.reset);
}
