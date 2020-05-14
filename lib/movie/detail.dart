import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  MovieDetail({Key key, @required this.id, @required this.title})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MovieDateilState();
  }

  final String id;
  final String title;
}

class _MovieDateilState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Text('detail ---- ${widget.id}');
  }
}
