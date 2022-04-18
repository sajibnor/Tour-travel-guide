import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MorePlacesPage extends StatefulWidget {
  // final String title;
  // final Color color;
  // MorePlacesPage({Key key, @required this.title, @required this.color})
  //     : super(key: key);

  @override
  _MorePlacesPageState createState() => _MorePlacesPageState();
}

class _MorePlacesPageState extends State<MorePlacesPage> {
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final String collectionName = 'places';
  late ScrollController controller;
  // DocumentSnapshot _lastVisible;
  // bool _isLoading;
  // List<DocumentSnapshot> _snap = new List<DocumentSnapshot>();
  // List<Place> _data = [];
  // bool _descending;
  // String _orderBy;

  // @override
  // void initState() {
  //   controller = new ScrollController()..addListener(_scrollListener);
  //   super.initState();
  //   _isLoading = true;
  //   if (widget.title == 'popular') {
  //     _orderBy = 'loves';
  //     _descending = true;
  //   } else if (widget.title == 'recommended') {
  //     _orderBy = 'comments count';
  //     _descending = true;
  //   } else {
  //     _orderBy = 'timestamp';
  //     _descending = false;
  //   }
  //   _getData();
  // }

  // onRefresh() {
  //   setState(() {
  //     _snap.clear();
  //     _data.clear();
  //     _isLoading = true;
  //     _lastVisible = null;
  //   });
  //   _getData();
  // }

  // Future<Null> _getData() async {
  //   QuerySnapshot data;
  //   if (_lastVisible == null)
  //     data = await firestore
  //         .collection(collectionName)
  //         .orderBy(_orderBy, descending: _descending)
  //         .limit(5)
  //         .get();
  //   else
  //     data = await firestore
  //         .collection(collectionName)
  //         .orderBy(_orderBy, descending: _descending)
  //         .startAfter([_lastVisible[_orderBy]])
  //         .limit(5)
  //         .get();

  //   if (data != null && data.docs.length > 0) {
  //     _lastVisible = data.docs[data.docs.length - 1];
  //     if (mounted) {
  //       setState(() {
  //         _isLoading = false;
  //         _snap.addAll(data.docs);
  //         _data = _snap.map((e) => Place.fromFirestore(e)).toList();
  //       });
  //     }
  //   } else {
  //     setState(() => _isLoading = false);
  //   }
  //   return null;
  // }

  // @override
  // void dispose() {
  //   controller.removeListener(_scrollListener);
  //   super.dispose();
  // }

  // void _scrollListener() {
  //   if (!_isLoading) {
  //     if (controller.position.pixels == controller.position.maxScrollExtent) {
  //       setState(() => _isLoading = true);
  //       _getData();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: CustomScrollView(
          // controller: controller,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
              backgroundColor: Colors.blue[200],
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: Container(
                  color: Colors.blue[200],
                  height: 120,
                  width: double.infinity,
                ),
                title: Text(
                  'Chittagong places',
                  // style: GoogleFonts.montserrat(
                  //     color: Colors.white, fontWeight: FontWeight.w500),
                ),
                titlePadding: EdgeInsets.only(left: 20, bottom: 15),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // if (index < _data.length) {
                    return _ListItem();
                    // }
                    // return Opacity(
                    //   opacity: _isLoading ? 1.0 : 0.0,
                    //   child: _lastVisible == null
                    //       ? Column(
                    //           children: [
                    //             LoadingCard(
                    //               height: 180,
                    //             ),
                    //             SizedBox(
                    //               height: 15,
                    //             )
                    //           ],
                    //         )
                    //       : Center(
                    //           child: SizedBox(
                    //               width: 32.0,
                    //               height: 32.0,
                    //               child: new CupertinoActivityIndicator()),
                    //         ),
                    // );
                  },
                  childCount: 4,
                ),
              ),
            )
          ],
        ),
        onRefresh: () async => null,
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  // final Place d;
  // final tag;
  // const _ListItem({Key key, @required this.d, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(top: 5, bottom: 10),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Hero(
                        tag: "tag",
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5p9chSGeLqyg3rZawPqbAbPcg6l-gL8ErUA&usqp=CAU",
                              fit: BoxFit.cover,
                            )),
                      )),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cox's bazar tour information ",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.maps_ugc,
                              size: 16,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Expanded(
                              child: Text(
                                "Chittagong , Cox's bazar tour information ",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 16,
                              color: Colors.grey[700],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "24 March 2022",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[700]),
                            ),
                            Spacer(),
                            Icon(
                              Icons.heart_broken,
                              size: 16,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[700]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.comment,
                              size: 16,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "40",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[700]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
        onTap: () => null
        //  nextScreen(context, PlaceDetails(data: d, tag: tag)),
        );
  }
}
