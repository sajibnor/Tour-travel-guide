// import 'dart:ffi';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageviewerUi extends StatelessWidget {
//   PageviewerUi({
//     Key? key,
// required data  }) : super(key: key);
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("db");

  @override
  Widget build(BuildContext context) {
    double heightsize = MediaQuery.of(context).size.height;
    double widthsize = MediaQuery.of(context).size.width;
    print(heightsize * .28.toDouble());

    return Stack(
      // overflow: Overflow.visible,
      // clipBehavior: Clip.none,
      // alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // color: Colors.blue,
            height: heightsize * .28,
            width: widthsize,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(widthsize * .06),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5p9chSGeLqyg3rZawPqbAbPcg6l-gL8ErUA&usqp=CAU",
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          height: 120,
          width: widthsize * 0.70,
          left: widthsize * 0.11,
          bottom: 10,
          // height: 220,
          // width: widthsize * 0.70,
          // bottom: heightsize * .004,
          // // top: heightsize * .16,
          // left: widthsize / 10,
          // right: widthsize / 10,
          child: Topcard(),
        ),
      ],
    );
  }
}

class Topcard extends StatelessWidget {
  const Topcard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(blurRadius: 4, offset: Offset(2, 2), color: Colors.blue)
          ]),
      // height: 120,
      // width: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.bottomLeft,
                child: Text("Cox Bazar ,Chittagong")),
            Row(
              children: [
                Icon(Icons.location_on),
                Text("Cox Bazar ,Chittagong"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 2,
              height: 2,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.heart,
                  color: Colors.red,
                ),
                Text("20"),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.comment,
                  color: Colors.red,
                ),
                Text("5"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
