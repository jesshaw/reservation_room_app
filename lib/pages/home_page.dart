import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservationroomapp/blocs/hotel/bloc.dart';
import 'package:reservationroomapp/blocs/tab/bloc.dart';
import 'package:reservationroomapp/models/app_tab.dart';
import 'package:reservationroomapp/pages/hotel/hotels_body.dart';
import 'package:reservationroomapp/pages/profile/profile_body.dart';
import 'package:reservationroomapp/services/mock/mock_hotel_service.dart';
import 'package:reservationroomapp/widgets/tab_selector.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          body: activeTab == AppTab.hotels
              ? BlocProvider(
                  create: (context) =>
                      HotelBloc(hotelService: MockHotelService())..add(Fetch()),
                  child: HotelsBody(),
                )
              : ProfileBody(),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
