// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ghuraghuri/controller/getdatacontroler.dart';
import 'package:line_icons/line_icons.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:provider/provider.dart';

import '../widgets/comment_count.dart';
import '../widgets/custom_cache_image.dart';
import '../widgets/love_count.dart';
import '../widgets/other_places.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controlerGetdata = Provider.of<GetdataCntr>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: "widget.tag",
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      height: 320,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Carousel(
                          dotBgColor: Colors.transparent,
                          showIndicator: true,
                          dotSize: 5,
                          dotSpacing: 15,
                          boxFit: BoxFit.cover,
                          images: [
                            CustomCacheImage(
                                "https://media-exp1.licdn.com/dms/image/C561BAQE1PHScPCSdKw/company-background_10000/0?e=2159024400&v=beta&t=_GnjRz7Wm40XiblMyecQbr4cHp1jK3zBHn651L_bfhE"),
                            CustomCacheImage(
                                "https://www.hotellinksolutions.com/images/blog/featured1.jpeg"),
                            CustomCacheImage(
                                "https://www.chandigarhhelp.com/wp-content/uploads/2021/09/Top-Travel-Agents-in-Zirakpur.jpg"),
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 15,
                  child: SafeArea(
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.withOpacity(0.9),
                      child: IconButton(
                        icon: Icon(
                          LineIcons.arrowLeft,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: Colors.grey,
                      ),
                      Expanded(
                          child: Text(
                        "widget.data.location",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      IconButton(
                          icon: Icon(Icons.local_movies),

                          //  BuildLoveIcon(
                          //     collectionName: collectionName,
                          //     uid: sb.uid,
                          //     timestamp: widget.data.timestamp),
                          onPressed: () {
                            // handleLoveClick();
                          }),
                      IconButton(
                          icon: Icon(Icons.local_movies),

                          //  BuildBookmarkIcon(
                          //     collectionName: collectionName,
                          //     uid: sb.uid,
                          //     timestamp: widget.data.timestamp),
                          onPressed: () {
                            // handleBookmarkClick();
                          }),
                    ],
                  ),
                  Text("widget.data.name",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[800])),

                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    height: 3,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  Row(
                    children: <Widget>[
                      // LoveCount(
                      //         collectionName: collectionName,
                      //         timestamp: widget.data.timestamp),

                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      // CommentCount(collectionName: collectionName, timestamp: widget.data.timestamp)
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Html(data: '''{widget.data.description}'''),
                  SizedBox(
                    height: 30,
                  ),
                  // TodoWidget(placeData: widget.data),
                  SizedBox(
                    height: 15,
                  ),
                  // OtherPlaces(stateName: widget.data.state, timestamp: widget.data.timestamp,),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
