import 'package:flutter/material.dart';

import 'moreplace.dart';

class RecommendedPlaces extends StatelessWidget {
  // RecommendedPlaces({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final RecommandedPlacesBloc rpb =
    //     Provider.of<RecommandedPlacesBloc>(context);

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 15,
            top: 10,
            right: 15,
          ),
          child: Row(
            children: <Widget>[
              Text(
                'Recommended places',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[800]),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.arrow_forward), onPressed: () => null

                  //  nextScreen(context, MorePlacesPage(
                  //   title: 'recommended',
                  //   color: Colors.green[300],)),

                  )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            padding: EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 15),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 8,
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              // if (rpb.data.isEmpty) return Container();
              return _ListItem();
            },
          ),
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  // final Place d;
  // const _ListItem({Key key, @required this.d}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: <Widget>[
          Hero(
            tag: 'recommended',
            child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5p9chSGeLqyg3rZawPqbAbPcg6l-gL8ErUA&usqp=CAU",
                      fit: BoxFit.cover,
                    ))),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 10, right: 15),
              child: FlatButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                color: Colors.grey[600]!.withOpacity(0.5),
                icon: Icon(
                  Icons.heart_broken_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: Text(
                  "30",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[900]!.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Cox's bazar tour information ",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.maps_ugc, size: 15, color: Colors.grey[400]),
                      Expanded(
                        child: Text(
                          "Cox's bazar tour information location,",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MorePlacesPage(),
          )),
    );
  }
}
