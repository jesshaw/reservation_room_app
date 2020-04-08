import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservationroomapp/blocs/hotel/bloc.dart';
import 'package:reservationroomapp/models/hotel.dart';

class HotelsBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HotelsBodyState();
}

class _HotelsBodyState extends State<HotelsBody> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  HotelBloc _hotelBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _hotelBloc = BlocProvider.of<HotelBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelError) {
          return Center(
            child: Text('failed to fetch hotels'),
          );
        }
        if (state is HotelLoaded) {
          if (state.hotels.isEmpty) {
            return Center(
              child: Text('no hotels'),
            );
          }

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.hotels.length
                  ? BottomLoader()
                  : HotelWidget(hotel: state.hotels[index]);
            },
            itemCount: state.hasReachedMax
                ? state.hotels.length
                : state.hotels.length + 1,
            controller: _scrollController,
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _hotelBloc.add(Fetch());
    }
  }
}

class HotelWidget extends StatelessWidget {
  final Hotel hotel;

  const HotelWidget({Key key, @required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return ListTile(
      leading: Image.network('${hotel.images[0]}',
          width: deviceSize.width * 0.3, fit: BoxFit.fitWidth)
//      Text(
//        '${hotel.hotelId}',
//        style: TextStyle(fontSize: 10.0),
//      )
      ,
      title: Text(hotel.name),
      isThreeLine: true,
      subtitle: Text(hotel.address),
      dense: true,
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
