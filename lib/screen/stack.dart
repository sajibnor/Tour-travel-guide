import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Container(
            height: 400,
            color: Colors.amber,
            width: 400,
          ),
          Container(
            height: 200,
            color: Colors.green,
            width: 200,
          ),
          Positioned(
            top: 350,
            left: 300,
            child: Container(
              height: 100,
              color: Colors.cyan,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
