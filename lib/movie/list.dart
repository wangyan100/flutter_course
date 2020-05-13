import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class MovieList extends StatefulWidget {
  MovieList({Key key, @required this.mt}) : super(key: key);

  // 电影的type值
  final String mt;
  @override
  _MovieListState createState() {
    return _MovieListState();
  }
}

// statefull need a state managment class
class _MovieListState extends State<MovieList> {
  int page=1;
  int pageSize=10;
  var mList=[];
  int total=0;

  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Text('这是电影列表页面 '+widget.mt + ' length->'+total.toString());
  }

  getMovieList() async{
    int offSet=(page-1)*pageSize;

    var response=await dio.get('http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offSet&count=$pageSize');
    var result=response.data;
    print(result);
    setState(() {
      mList=result['subjects'];
      total=result['total'];
    });
  }
}
