import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghuraghuri/screen/gridviewui.dart';
import 'package:ghuraghuri/screen/pageviwer.dart';
import 'package:ghuraghuri/screen/search.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pages = [
    PageviewerUi(),
    PageviewerUi(),
    PageviewerUi(),
    PageviewerUi(),
  ];

  var l = [
    Container(
      color: Colors.blue,
      height: 400,
      width: 400,
    ),
    Container(
      color: Colors.amber,
      height: 400,
      width: 400,
    ),
    Container(
      color: Colors.green,
      height: 400,
      width: 400,
    ),
    Container(
      color: Colors.amber,
      height: 400,
      width: 400,
    ),
    Container(
      color: Colors.green,
      height: 400,
      width: 400,
    )
  ];
  var pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("Travel Hour"),
            subtitle: Text("Bangladesh Travel"),
            trailing: CircleAvatar(
              child: Text("A"),
            ),
          ),
          SearchUi(),
          Container(
            height: 250,
            width: double.infinity,
            child: PageView(controller: pagecontroller, children: pages),
          ),

          Center(
            child: SmoothPageIndicator(
              controller: pagecontroller,
              count: 6,
              axisDirection: Axis.horizontal,
              effect: JumpingDotEffect(
                  spacing: 8.0,
                  radius: 15.0,
                  dotWidth: 24.0,
                  dotHeight: 16.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Colors.grey,
                  verticalOffset: 12,
                  jumpScale: 3,
                  activeDotColor: Colors.indigo),
            ),
          ),

          ListTile(
            title: Text("Populer palce"),
            trailing: Icon(Icons.arrow_forward),
          ),
         GriedviewPlace(),
          ListTile(
            title: Text("Recent palce"),
            trailing: Icon(Icons.arrow_forward),
          ),
          GriedviewPlace()
          // Container(height: 200,
          // child:GridView.builder(gridDelegate: SliverGridDelegate(), itemBuilder:(context, index) => ,)

          // )
        ],
      ),
    );
  }
}


// Widget ingleProducts() {
//   return Container(
//     margin: EdgeInsets.all(5),
//     height: 250,
//     width: 170,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 2,
//           child: Image.asset("assets/img7.png"),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // ignore: prefer_const_literals_to_create_immutables
//               children: [
//                 Text(
//                   "Neapolitan Pizza",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "300Tk/20 cm",
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                     // fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Row(children: [
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.only(left: 5),
//                       height: 30,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                       child: Row(
//                         // ignore: prefer_const_literals_to_create_immutables
//                         children: [
//                           Expanded(child: Text("20 cm")),
//                           // Expanded(
//                           //   child: Icon(
//                           //     Icons.arrow_drop_down,
//                           //     // size: 25,
//                           //     color: Colors.green,
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Expanded(
//                     child: Container(
//                       height: 30,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             Icon(
//                               Icons.remove,
//                               size: 20,
//                               color: Colors.redAccent,
//                             ),
//                             Text(
//                               "1",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.redAccent,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             Icon(
//                               Icons.add,
//                               size: 20,
//                               color: Colors.redAccent,
//                             ),
//                           ]),
//                     ),
//                   ),
//                 ]),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
