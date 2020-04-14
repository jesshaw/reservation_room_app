import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './services/mock/mock_attraction_service_test.dart' as mock_attraction_service_test;
import './services/mock/mock_hotel_service_test.dart' as mock_hotel_service_test;
import './services/mock/mock_user_service_test.dart' as mock_user_service_test;

import './services/real/real_user_service_test.dart' as real_user_service_test;

import './ui/widget_test.dart' as widget_test;

void main() {
  mock_attraction_service_test.main();
  mock_hotel_service_test.main();
  mock_user_service_test.main();
  real_user_service_test.main();

  widget_test.main();
}
