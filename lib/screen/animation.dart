import 'package:flutter/material.dart';

import 'home.dart';
import 'loadingimage.dart';

class Myanimation extends StatelessWidget {
  const Myanimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                curve: Curves.ease,
                duration: const Duration(seconds: 40),
                builder: (BuildContext context, double opacity, Widget? child) {
                  return Opacity(
                      opacity: opacity,
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.red,
                        child: FlutterLogo(),
                      ));
                }),
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(pageroute(AddImage()));
              },
              child: Text("data"))
        ],
      ),
    );
  }
}

class Myanimation2 extends StatefulWidget {
  // const Myanimation2({ Key? key }) : super(key: key);

  @override
  _Myanimation2State createState() => _Myanimation2State();
}

class _Myanimation2State extends State<Myanimation2> {
  bool selected = true;
  var opct = .1;

  onopacity() {
    setState(() {
      opct == .1 ? opct = .9 : opct = 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Container(
            height: 400,
            width: 500,
            color: Colors.yellow[200],
            child: AnimatedAlign(
              alignment: selected ? Alignment.bottomRight : Alignment.topLeft,
              duration: Duration(seconds: 4),
              curve: Curves.decelerate,
              child: InkWell(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: FlutterLogo(
                  size: 30,
                ),
              ),
            ),
          )),
          Container(
            height: 300,
            width: 400,
            color: Colors.blueGrey,
            child: Opacity(
              opacity: opct,
              child: FlutterLogo(
                duration: Duration(seconds: 4),
                size: 30,
              ),
            ),
          ),
          OutlinedButton(onPressed: onopacity, child: Text("Button"))
        ],
      ),
    );
  }
}
