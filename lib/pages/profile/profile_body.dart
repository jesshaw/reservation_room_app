import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservationroomapp/widgets/common_scaffold.dart';
import 'package:reservationroomapp/widgets/profile_title.dart';

class ProfileBody extends StatelessWidget {
  Size deviceSize;

  Widget profileHeader() => Container(
        height: deviceSize.height / 4,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.black,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: NetworkImage(
                          "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4"),
                    ),
                  ),
                  Text(
                    "Pawan Kumar",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Text(
                    "Flutter Developer",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget imagesCard() => Container(
        height: deviceSize.height / 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Photos",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
              ),
              Expanded(
                child: Card(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          "https://cdn.pixabay.com/photo/2016/10/31/18/14/ice-1786311_960_720.jpg"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget profileColumn() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4"),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Pawan Kumar posted a photo",
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "25 mins ago",
                  )
                ],
              ),
            ))
          ],
        ),
      );

  Widget postCard() => Container(
        width: double.infinity,
        height: deviceSize.height / 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Post",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
              ),
              profileColumn(),
              Expanded(
                child: Card(
                  elevation: 2.0,
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2018/06/12/01/04/road-3469810_960_720.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget bodyData() => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            profileHeader(),
            followColumn(deviceSize),
            imagesCard(),
            postCard(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
        SizedBox(
          width: 5.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        )
      ],
      ),
      body: bodyData(),
    );
  }
}

followColumn(Size deviceSize) => Container(
      height: deviceSize.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ProfileTitle(
            title: "1.5K",
            subTitle: "Posts",
          ),
          ProfileTitle(
            title: "2.5K",
            subTitle: "Followers",
          ),
          ProfileTitle(
            title: "10K",
            subTitle: "Comments",
          ),
          ProfileTitle(
            title: "1.2K",
            subTitle: "Following",
          )
        ],
      ),
    );
