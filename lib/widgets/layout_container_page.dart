import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutContainerPage(),
    );
  }
}

class LayoutContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Layout Container'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 135, height: 135, color: Colors.pink[100]),
                Container(width: 120, height: 120, color: const Color.fromARGB(255, 169, 11, 11)),
              ],
            ),
            SizedBox(height: 50),
            Container(width: 80, height: 80, color: const Color.fromARGB(255, 4, 67, 9)),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 80, height: 80, color: const Color.fromARGB(255, 11, 9, 4)),
                Container(width: 80, height: 80, color: const Color.fromARGB(255, 112, 131, 215)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
