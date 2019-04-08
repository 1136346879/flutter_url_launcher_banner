import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/HomeDetailPage.dart';
import 'package:flutter_app/Publish.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/banner/pagination.dart';

//定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

class HomePage extends StatefulWidget {


  HomePage(GlobalKey key) {
    _globalKey = key;
  }

  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<HomePage> {
  // 增大字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // 副标题字体样式
  final _smallFont = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.red);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('首页')
          ),
          body: Column(
        children: <Widget>[
        Stack(//帧布局  
        //alignment: const FractionalOffset(0.9, 0.1),//方法一
        children: <Widget>[
            Pagination(),//轮播图 banner
            Positioned(//方法二
            top: 10.0,
            left: 0.0,
            // child: DisclaimerMsg(key:key,pWidget:this)
             child:Text('banner学习',)  //悬浮在banner上方
            ),
          ]),
        SizedBox(height: 1, child:Container(color: Theme.of(context).primaryColor)),
        SizedBox(height: 10),
        ],
      ),
        );
      
  }

  @override
  void dispose() {
    super.dispose();
  }
}
