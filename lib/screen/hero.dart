// import 'dart:html';

import 'package:flutter/material.dart';

class Myhero extends StatelessWidget {
  const Myhero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: 100,
              // width: 100,
              child: Hero(
                tag: "fluttelogo",
                child: FlutterLogo(
                  size: 40,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Myhero2()));
                },
                child: Text("Click"))
          ],
        ),
      ),
    );
  }
}

class Myhero2 extends StatelessWidget {
  const Myhero2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // height: 200,
              // width: 300,
              child: Hero(
                tag: "fluttelogo",
                child: FlutterLogo(
                  textColor: Colors.amber,
                  size: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
