import 'package:flutter/material.dart';

class Travelguide extends StatelessWidget {
  const Travelguide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    onPressed: () {},
                    child: Icon(Icons.arrow_back),
                  ),
                  // Wrap(
                  //     direction: Axis.horizontal,
                  //     runSpacing: 2,
                  //     clipBehavior: Clip.none,
                  //     children: [
                  //       TextButton(onPressed: () {}, child: Text("button 1")),
                  //       TextButton(onPressed: () {}, child: Text("button 1")),
                  //       TextButton(onPressed: () {}, child: Text("button 1")),
                  //       TextButton(onPressed: () {}, child: Text("button 1")),
                  //       TextButton(onPressed: () {}, child: Text("button 1")),
                  //       TextButton(onPressed: () {}, child: Text("button 1")),
                  //       TextButton(onPressed: () {}, child: Text("button 1")),
                  //       TextButton(onPressed: () {}, child: Text("button 1"))
                  //     ])
                ],
              ),
            )
          ],
        ),
        height: double.maxFinite,
        width: double.infinity,
        color: Colors.grey,
      ),
      extendBody: true,

      bottomSheet: BottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0))),
        elevation: 23,
        builder: (context) => Container(
          decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0))),
          height: 450,
          // color: Colors.amber,
        ),
        onClosing: () {},
      ),

      // BottomSheet(
      //   onClosing: () {},
      //   builder: (context) => Container(
      //     height: 20,
      //   ),
      // ),
    );
  }
}
