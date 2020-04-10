import 'package:flutter/material.dart';

class PeripheryAttractionBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //search bar ref: https://github.com/rodolfoggp/search_app_bar
        appBar: AppBar(title: Text('room typ')),
        body: Text('room type list')
    );
  }
}
