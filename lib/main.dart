import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphism_design/components/ButtonComponent.dart';
import 'package:neumorphism_design/components/ButtonComponentProperties.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[850] : Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonComponent(
                    props: new ButtonComponentProperties(
                        darkMode ? "FF303030" : "FFE0E0E0", child1(), darkMode),
                    onClick: () => {print("hello test")}),
                ButtonComponent(
                    props: new ButtonComponentProperties(
                        darkMode ? "FF303030" : "FFE0E0E0", child2(), darkMode),
                    onClick: () => {print("hello test")}),
              ],
            ),
            SizedBox(height: 150,),
            Transform.scale(
              scale: 2.0,
              child: Switch(
                value: darkMode,
                onChanged: (value) {
                  setState(() {
                    darkMode = value;
                  });
                },
                activeTrackColor: Colors.white,
                activeColor: Colors.green,
              ),
            ),
            SizedBox(height: 50,),
            Text(
              darkMode ? "Switch to light" : "Switch to dark",
              style: TextStyle(
                 letterSpacing: 3.0,
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget child1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(darkMode ? Icons.search : Icons.home,
            size: 100, color: darkMode ? Colors.white : Colors.black),
        Text(
          darkMode ? "Search" : "Home",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
            color: darkMode ? Colors.white : Colors.grey[800]!,
          ),
        )
      ],
    );
  }

  Widget child2() {
    return Icon(darkMode ? Icons.play_arrow : Icons.pause,
        size: 100, color: darkMode ? Colors.white : Colors.black);
  }
}
