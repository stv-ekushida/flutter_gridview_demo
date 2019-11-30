import 'package:flutter/material.dart';
import 'package:flutter_gridview_demo/Player.dart';
import 'package:flutter_gridview_demo/MyHomePageDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Player> players = [
    new Player(
        name: "菊池　涼介",
        position: "二塁手",
        fileName: "images/kikuchi.jpeg",
        description: "菊池 涼介（きくち りょうすけ、1990年3月11日[2] - ）は、東京都東大和市出身のプロ野球選手（内野手）。右投右打。広島東洋カープ所属。"),
    new Player(
        name: "大瀬良　大地",
        position: "投手",
        fileName: "images/osera.jpeg",
        description: "大瀬良 大地は、長崎県大村市出身のプロ野球選手。右投右打。広島東洋カープ所属¥n右投右打。広島東洋カープ所属。"),
    new Player(
        name: "鈴木　誠也",
        position: "外野手",
        fileName: "images/suzuki.jpeg",
        description: "大瀬良 大地は、長崎県大村市出身のプロ野球選手。右投右打。広島東洋カープ所属"),
    new Player(
        name: "田中　広輔",
        position: "遊撃手",
        fileName: "images/tanaka.jpeg",
        description: "大瀬良 大地は、長崎県大村市出身のプロ野球選手。右投右打。広島東洋カープ所属"),
    new Player(
        name: "會澤　翼",
        position: "捕手",
        fileName: "images/aizawa.jpeg",
        description: "大瀬良 大地は、長崎県大村市出身のプロ野球選手。右投右打。広島東洋カープ所属"),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Demo'),
      ),
      body: buildGridViewCell(),
    );
  }

  Widget buildGridViewCell() {

    return GridView.builder(
      itemCount: players.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            //タップイベント
            onTap: () {
              toNextPage(players[index]);
            },

            //ビュー
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset(players[index].fileName),
                ),
                Container(
                  child: ListTile(
                    title: Text(players[index].name),
                    subtitle: Text(
                      players[index].position,
                    ),
                    leading: Icon(Icons.person),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void toNextPage(Player player) {

    //画面遷移
    Navigator.push(
        context,
        MaterialPageRoute( //引数を渡す
            builder: (context) => MyHomePageDetail(player: player)));
  }
}
