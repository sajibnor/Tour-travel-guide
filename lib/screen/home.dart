// import 'dart:js';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghuraghuri/controller/getdatacontroler.dart';
import 'package:ghuraghuri/screen/adminPanel/updaload_place.dart';
import 'package:ghuraghuri/screen/blogs.dart';
import 'package:ghuraghuri/screen/gridviewui.dart';
import 'package:ghuraghuri/screen/hero.dart';
import 'package:ghuraghuri/screen/imagepicker.dart';
import 'package:ghuraghuri/screen/introduction.dart';
import 'package:ghuraghuri/screen/loadingimage.dart';
import 'package:ghuraghuri/screen/moreplace.dart';
import 'package:ghuraghuri/screen/pageviwer.dart';
import 'package:ghuraghuri/screen/place_details.dart';
import 'package:ghuraghuri/screen/search.dart';
import 'package:ghuraghuri/screen/suggetionblog.dart';
import 'package:ghuraghuri/screen/t.dart';
import 'package:ghuraghuri/screen/travelguid.dart';
import 'package:ghuraghuri/screen/ui2.dart';
import 'package:ghuraghuri/untils/routing.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timelines/timelines.dart';

// import 'adminPanel/updaload_place.dart';

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

  var pagecontroller = PageController();
  int listIndex = 2;

  @override
  Widget build(BuildContext context) {
    final controlerGetdata = Provider.of<GetdataCntr>(context);
    double heightsize = MediaQuery.of(context).size.height;
    double widthsize = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NewDrawer(),
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
              onTap: () {
                nextPage(context, Uploadplace());
              },
            ),
            // Row(
            //   children: [
            //     TextButton(
            //         onPressed: () {
            //           nextPage(context, Uploadplace());
            //         },
            //         child: Text("imagepicker")),
            //     TextButton(
            //         onPressed: () {
            //           nextPage(context, AddImage());
            //         },
            //         child: Text("imagepicker")),
            //   ],
            // ),
            SearchUi(),
            Container(
              height: heightsize * .33,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  onPageChanged: (index) {
                    setState(() {
                      listIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => pages[index]
                  //  Container(

                  //   height: heightsize * .33,
                  //   width: double.infinity,
                  //   child: PageView(controller: pagecontroller, children: pages),
                  // ),
                  ),
            ),
            // SizedBox(
            //   height: 40,
            // ),

            Center(
              child: DotsIndicator(
                dotsCount: 5,
                position: listIndex.toDouble(),
                decorator: DotsDecorator(
                  color: Colors.black26,
                  activeColor: Colors.black,
                  spacing: EdgeInsets.only(left: 6),
                  size: const Size.square(5.0),
                  activeSize: const Size(20.0, 5.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),

                  // controller: pagecontroller,
                  // count: 6,
                  // axisDirection: Axis.horizontal,
                  // effect: JumpingDotEffect(
                  //     spacing: 8.0,
                  //     radius: 15.0,
                  //     dotWidth: 24.0,
                  //     dotHeight: 16.0,
                  //     paintStyle: PaintingStyle.fill,
                  //     strokeWidth: 1.5,
                  //     dotColor: Colors.grey,
                  //     verticalOffset: 12,
                  //     jumpScale: 3,
                  //     activeDotColor: Colors.indigo),
                ),
              ),
            ),

            ListTile(
              title: Text("Populer palce"),
              trailing: Icon(Icons.arrow_forward),
            ),
            GriedviewPlace(),
            ListTile(
              onTap: () {
                Navigator.of(context).push(pageroute(IntroductionPage()));
              },
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
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  top: 10,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Recently added',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[800]),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () => null,
                    )
                  ],
                ),
              ),
            ),
            // ListOfCard(),
            Container(
                child: Column(
              children: List.generate(
                8,
                (index) => ListOfCard(onpress: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Blog()));
                }),
              ),
            )

                //  Container(height: ,)

                // Container(height: 200,
                // child:GridView.builder(gridDelegate: SliverGridDelegate(), itemBuilder:(context, index) => ,)

                // )
                ),
            RecommendedPlaces()
          ],
        ),
      ),
    );
  }
}

class ListOfCard extends StatelessWidget {
  var onpress;
  var index;
  // ListOfCard({this.index, required this.onpress});

  ListOfCard({Key? key, this.index, required this.onpress}) : super(key: key);

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
          InkWell(
            onTap: onpress,
            child: Container(
              height: 120,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkDnEM41wBbhuV1wpA9v4t0x-3jadRxy-uiw&usqp=CAU",
                  fit: BoxFit.cover,
                ),
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

Route pageroute(Widget widget) {
  print("object");
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-.1, .1);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
