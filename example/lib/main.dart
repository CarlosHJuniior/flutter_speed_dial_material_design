import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial_material_design/flutter_speed_dial_material_design.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  SpeedDialController _controller = SpeedDialController();
  bool test = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.directional(
            textDirection: TextDirection.rtl,
            end: 0,
            bottom: 200,
            child: Container(child: TextField(), width: MediaQuery.of(context).size.width),
          )
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildFloatingActionButton() {
    final icons = [
      SpeedDialAction(child: Icon(Icons.mode_edit), label: Text('Um conteudo aqui', style: TextStyle(fontSize: 14, color: Colors.black, inherit: false))),
      SpeedDialAction(child: Icon(Icons.date_range)),
      SpeedDialAction(child: Icon(Icons.list), label: Text('Um conteudo aqui', style: TextStyle(fontSize: 14, color: Colors.black, inherit: false))),
    ];

    return SpeedDialFloatingActionButton(
      actions: icons,
      childOnFold: Icon(Icons.add, key: UniqueKey()),
      useRotateAnimation: true,
      onAction: _onSpeedDialAction,
      controller: _controller,
      fullscreen: true,
      visible: test,
    );
  }

  _onSpeedDialAction(int selectedActionIndex) {
    print('$selectedActionIndex Selected');
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () async {
                setState(() => test = !test);
                await showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(height: 300, color: Colors.red[200]);
                  },
                );
                setState(() => test = true);
              },
            ),
            IconButton(
              icon: Icon(Icons.today),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Test())),
            ),
          ],
        ),
      ),
    );
  }
}

class Test extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.amberAccent),
    );
  }
}
