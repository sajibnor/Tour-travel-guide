import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GriedviewPlace extends StatelessWidget {
  const GriedviewPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightsize = MediaQuery.of(context).size.height;
    double widthsize = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            // border: Border(
            //   left: BorderSide(
            //     color: Colors.green,
            //     width: 3,
            //   ),
            // ),
          ),
          height: 220,
          // width: 600,
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 2),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS_tAV18gbnfB5xornOjNZbz1E88Cekj1WBA&usqp=CAU",
                      height: 220,
                      // width: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    // right: widthsize * .04,
                    // bottom: heightsize * .16,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        // margin: EdgeInsets.all(10),
                        color: Colors.black.withOpacity(.2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.heart,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "20",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cox's bazar tour information ",
                        maxLines: 2,
                        // softWrap: true,
                        // textScaleFactor: true,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            itemCount: 10,
          )),
    );
  }
}
