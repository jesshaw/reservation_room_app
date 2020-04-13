import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reservationroomapp/blocs/attraction/attraction_bloc.dart';
import 'package:reservationroomapp/blocs/attraction/attraction_event.dart';
import 'package:reservationroomapp/blocs/attraction/attraction_state.dart';
import 'package:reservationroomapp/models/attraction.dart';
import 'package:transparent_image/transparent_image.dart';

class PeripheryBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PeripheryBody();
}

class _PeripheryBody extends State<PeripheryBody> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  AttractionBloc _attractionBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _attractionBloc = BlocProvider.of<AttractionBloc>(context);
  }

  Size deviceSize;

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
//    https://github.com/letsar/flutter_staggered_grid_view

    return Scaffold(
        appBar: AppBar(title: Text('trip attraction')),
        body: BlocBuilder<AttractionBloc, AttractionState>(
          builder: (context, state) {
            if (state is AttractionLoaded) {
              if (state.attractions.isEmpty) {
                return Center(
                  child: Text('no attractions'),
                );
              }

              return StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(5.0),
                primary: false,
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                itemCount: state.attractions.length,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.attractions.length
                      ? _BottomLoader()
                      : _Tile(attraction: state.attractions[index]);
                },
                staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
                controller: _scrollController,
              );
            }

            if (state is AttractionError) {
              return Center(
                child: Text('failed to fetch hotels'),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _attractionBloc.add(FetchAttraction());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _BottomLoader extends StatelessWidget {
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

class _Tile extends StatelessWidget {
  const _Tile({this.attraction});

  final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              //new Center(child: new CircularProgressIndicator()),
              new Center(
                child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: attraction.images[0],
                ),
              ),
              new Text(
                attraction.contactInfo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  attraction.slogan,
                  style: const TextStyle(color: Colors.grey),
                ),
                new Text(
                  attraction.address,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
