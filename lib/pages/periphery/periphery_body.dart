import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reservationroomapp/models/attraction.dart';
import 'package:transparent_image/transparent_image.dart';


class PeripheryBody extends StatelessWidget {
  final List<Attraction> attractions;

  PeripheryBody({Key key, this.attractions})
      : _sizes = _createSizes(_kItemCount).toList(),
        super(key: key);

  Size deviceSize;

  static const int _kItemCount = 1000;
  final List<IntSize> _sizes;

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

//    return Scaffold(
//      //search bar ref: https://github.com/rodolfoggp/search_app_bar
//      appBar: AppBar(title: Text('trip attraction')),
//      body: Container(
//          padding: const EdgeInsets.all(5.0),
//          child: Wrap(
//            spacing: 10.0, // gap between adjacent chips
//            runSpacing: 8.0, // gap between lines
//            children: <Widget>[
//              FadeInImage.assetNetwork(
//                  placeholder: 'assets/flutter_logo.png',
//                  image:
//                      'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
//                  width: deviceSize.width * 0.5 - 10),
//              FadeInImage.assetNetwork(
//                  placeholder: 'assets/flutter_logo.png',
//                  image:
//                      'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
//                  width: deviceSize.width * 0.5 - 10),
//              FadeInImage.assetNetwork(
//                  placeholder: 'assets/flutter_logo.png',
//                  image:
//                      'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg',
//                  width: deviceSize.width * 0.5 - 10),
//              FadeInImage.assetNetwork(
//                  placeholder: 'assets/flutter_logo.png',
//                  image:
//                      'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
//                  width: deviceSize.width * 0.5 - 10),
//              FadeInImage.assetNetwork(
//                  placeholder: 'assets/flutter_logo.png',
//                  image:
//                      'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
//                  width: deviceSize.width * 0.5 - 10),
//              FadeInImage.assetNetwork(
//                  placeholder: 'assets/flutter_logo.png',
//                  image:
//                      'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg',
//                  width: deviceSize.width * 0.5 - 10),
////
//            ],
//          )),
//    );

//    return Scaffold(
//      //search bar ref: https://github.com/rodolfoggp/search_app_bar
//      appBar: AppBar(title: Text('trip attraction')),
//      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
//        return Container(
//
//            padding: const EdgeInsets.all(5.0),
//            child: Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//              Column(
////                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  SizedBox(
//                    height: 5.0,
//                  ),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  SizedBox(
//                    height: 5.0,
//                  ),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                ],
//              ),
//              SizedBox(
//                width: 10.0,
//              ),
//              Column(
//                children: [
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  SizedBox(
//                    height: 5.0,
//                  ),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  SizedBox(
//                    height: 5.0,
//                  ),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                  FadeInImage.assetNetwork(
//                      placeholder: 'assets/flutter_logo.png',
//                      image:
//                          'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg',
//                      width: deviceSize.width * 0.5 - 10),
//                ],
//              )
//            ]));
//      }),
//    );

//    https://github.com/letsar/flutter_staggered_grid_view

    return Scaffold(
        appBar: AppBar(title: Text('trip attraction')),
        body: StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(5.0),
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) => new _Tile(index, _sizes[index]),
          staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
        ));
  }
}

List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
          (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

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
                  image: 'https://picsum.photos/${size.width}/${size.height}/',
                ),
              ),
              new Text(
                'Image number $index',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  'Width: ${size.width}',
                  style: const TextStyle(color: Colors.grey),
                ),
                new Text(
                  'Height: ${size.height}',
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
