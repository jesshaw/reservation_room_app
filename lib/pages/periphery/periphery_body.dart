import 'package:flutter/material.dart';
import 'package:reservationroomapp/models/attraction.dart';
import 'package:transparent_image/transparent_image.dart';

class PeripheryBody extends StatelessWidget {
  final List<Attraction> attractions;

  PeripheryBody({Key key, this.attractions}) : super(key: key);

  Size deviceSize;

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'http://ztd00.photos.bdimg.com/ztd/w=700;q=50/sign=cf3f1428a1ec8a13141a55e0c738e0b2/dc54564e9258d1092bcd9975d958ccbf6d814dce.jpg',
              width: deviceSize.width * 0.5 - 10,
              fit: BoxFit.fitWidth),
          /*2*/
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Oeschinen Lake Campground',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Kandersteg, Switzerland',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );

    List<Widget> leftRightColumns(List<Attraction> attractions) {
      final leftColumn = Column(
        children: [titleSection, titleSection],
      );
      final rightColumn = Column(children: [titleSection]);
      leftColumn.children.add(titleSection);

      leftColumn.children.addAll([
        titleSection,
        titleSection,
      ]);
      rightColumn.children.addAll([
        titleSection,
      ]);
      return [leftColumn, rightColumn];
    }

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

    return Scaffold(
      //search bar ref: https://github.com/rodolfoggp/search_app_bar
      appBar: AppBar(title: Text('trip attraction')),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Container(

            padding: const EdgeInsets.all(5.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/232/232824277.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  SizedBox(
                    height: 5.0,
                  ),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  SizedBox(
                    height: 5.0,
                  ),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg',
                      width: deviceSize.width * 0.5 - 10),
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                children: [
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494929.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  SizedBox(
                    height: 5.0,
                  ),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/245/245494172.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  SizedBox(
                    height: 5.0,
                  ),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-r.static.booking.cn/images/hotel/max1280x900/330/33048216.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-q.static.booking.cn/images/hotel/max1280x900/179/179989150.jpg',
                      width: deviceSize.width * 0.5 - 10),
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/flutter_logo.png',
                      image:
                          'https://ac-r.static.booking.cn/images/hotel/max1280x900/179/179990422.jpg',
                      width: deviceSize.width * 0.5 - 10),
                ],
              )
            ]));
      }),
    );
  }
}
