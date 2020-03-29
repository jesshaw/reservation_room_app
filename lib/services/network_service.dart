import 'package:reservation_room_app/services/rest_client.dart';

abstract class NetworkService {
  RestClient reset;

  NetworkService(this.reset);
}
