import 'package:flutter/material.dart';
import 'package:flutter_gridview_demo/Player.dart';

class MyHomePageDetail extends StatelessWidget {

  //引数を追加
  final Player player;

  MyHomePageDetail({Key key, @required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(player.name),
        ),
        body: Column(
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 1,
              child: Image.asset(
                player.fileName,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                player.description,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
