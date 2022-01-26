import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghuraghuri/screen/gridviewui.dart';
import 'package:ghuraghuri/screen/pageviwer.dart';
import 'package:ghuraghuri/screen/search.dart';
import 'package:ghuraghuri/screen/ui2.dart';
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
    double heightsize = MediaQuery.of(context).size.height;
    double widthsize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
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
              height: heightsize * .33,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: l.length,
                itemBuilder: (context, index) => Container(
                  height: heightsize * .33,
                  width: double.infinity,
                  child: PageView(controller: pagecontroller, children: pages),
                ),
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),

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
            GriedviewPlace(),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage(""))),
            ),
            // ListOfCard(),
            Container(
              child: Column(
                children: List.generate(20, (index) => ListOfCard()),
              ),
            )

            //  Container(height: ,)

            // Container(height: 200,
            // child:GridView.builder(gridDelegate: SliverGridDelegate(), itemBuilder:(context, index) => ,)

            // )
          ],
        ),
      ),
    );
  }
}

class ListOfCard extends StatelessWidget {
  const ListOfCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(2, 2),
                        color: Colors.black12)
                  ]),
              height: 130,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
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
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkDnEM41wBbhuV1wpA9v4t0x-3jadRxy-uiw&usqp=CAU",
                fit: BoxFit.cover,
              ),
            ),
          )
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
