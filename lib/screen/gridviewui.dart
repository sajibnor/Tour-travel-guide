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
          height: 200,
          width: 400,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 2),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 400,
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
                // color: Colors.cyan,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS_tAV18gbnfB5xornOjNZbz1E88Cekj1WBA&usqp=CAU",
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: widthsize * .04,
                      bottom: heightsize * .16,
                      child: Card(
                        color: Colors.black.withOpacity(.2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: Icon(
                                CupertinoIcons.heart,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: Text(
                                "20",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        // left: widthsize * .04,
                        top: heightsize * .14,
                        child: Container(
                          // height: 80,
                          width: widthsize * .50,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Cox's bazar tour information ",
                              maxLines: 2,
                              // softWrap: true,
                              // textScaleFactor: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            itemCount: 10,
          )),
    );
  }
}
