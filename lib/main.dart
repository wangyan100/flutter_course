import 'package:flutter/material.dart';
import './movie/list.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '女神专用',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('电影列表'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Dasiy'),
                accountEmail: Text('wayanbox@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars0.githubusercontent.com/u/35532882?s=400&u=58e98b3b995459cb5edb3d1607d0c3b39ac17661&v=4'),
                ),
                decoration: BoxDecoration(
                    // 设置背景图片
                    image: DecorationImage(
                        // 控制图片填充效果
                        fit: BoxFit.fill,
                        // 指定图片地址
                        image: NetworkImage(
                            'http://www.liulongbin.top:3005/images/bg1.jpg'))),
              ),
              ListTile(
                title: Text('用户反馈'),
                trailing: Icon(Icons.feedback),
              ),
              ListTile(
                title: Text('系统设置'),
                trailing: Icon(Icons.settings),
              ),
              ListTile(
                title: Text('我要发布'),
                trailing: Icon(Icons.send),
              ),
              Divider(),
              ListTile(
                title: Text('注销'),
                trailing: Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.black),
          height: 50,
          child: TabBar(
            labelStyle: TextStyle(height: 0, fontSize: 10),
            tabs: <Widget>[
              Tab(icon: Icon(Icons.movie_filter), text: '正在热映'),
              Tab(icon: Icon(Icons.movie_creation), text: '即将上演'),
              Tab(icon: Icon(Icons.local_movies), text: 'Top20'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MovieList(mt:'in_theaters'),
            MovieList(mt:'coming_soon'),
            MovieList(mt: 'top250'),
          ],
        ),
      ),
    );
  }
}
