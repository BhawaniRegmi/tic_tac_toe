import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: "TicTacToe",
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> stringL = [];
  String condition = "edit";
  Icon circle = Icon(Icons.circle);
  Icon cross = Icon(Icons.cancel);
  Icon edit = Icon(Icons.edit);
  bool circleHunuparne = true;
  @override
  void initState() {
    super.initState();
    stringL = List.filled(9, 'edit');
  }

  playGame(int index) {
    if (this.stringL[index] == "edit") {
      setState(() {
        circleHunuparne = !circleHunuparne;
        if (circleHunuparne) {
          this.stringL[index] = "circle";
        } else {
          this.stringL[index] = "cross";
        }
      });
    }
  }

  getIcon(String condition) {
    switch (condition) {
      case 'circle':
        return circle;
        break;
      case "cross":
        return cross;
        break;
      case "edit":
        return edit;
        break;
    }
  }

  clear() {
    setState(() {
      stringL = List.filled(9, "edit");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(children: [
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  child: MaterialButton(
                      child: getIcon(this.stringL[index]),
                      onPressed: () {
                        playGame(index);
                      }),
                );
              }),
        ),
        Container(
          height: 50,
          child: MaterialButton(
              child: Text("Reset"),
              onPressed: () {
                clear();
              }),
        )
      ]),
    );
  }
}
