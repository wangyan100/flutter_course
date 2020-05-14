import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './detail.dart';

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
  int page = 1;
  int pageSize = 10;
  var mList = [];
  int total = 0;

  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mList.length,
      itemBuilder: (BuildContext ctx, int i) {
        var mItem = mList[i];

        return GestureDetector(
          onTap: () {
            print('pressed ...');
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
              return MovieDetail(id: mItem['id'], title: mItem['title']);
            }));
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.black12),
                )),
            child: Row(
              children: <Widget>[
                Image.network(
                  mItem['images']['small'],
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('电影名称 ${mItem['title']}'),
                      Text('上演年份 ${mItem['year']}'),
                      Text('电影类型 ${mItem['genres'].join(' * ')}'),
                      Text('电影名称 ${mItem['title']}'),
                      Text('豆瓣评分 ${mItem['rating']['average']}分')
                      //Text('主要演员 ${mItem['casts'][2]['name']}')
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getMovieList() async {
    int offSet = (page - 1) * pageSize;

    var response = await dio.get(
        'http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offSet&count=$pageSize');
    var result = response.data;

    setState(() {
      mList = result['subjects'];
      total = result['total'];
    });
  }
}
