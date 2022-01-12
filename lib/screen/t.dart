import 'package:flutter/material.dart';
import 'package:ghuraghuri/screen/ui1.dart';
import 'package:ghuraghuri/screen/uitwo.dart';
import 'package:ghuraghuri/settings.dart';

class T extends StatelessWidget {
  const T({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Uione()));
                },
                tileColor: Colors.cyan,
                title: Text("UI one"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => UiTwo()));
                },
                tileColor: Colors.cyan,
                title: Text("UI Two"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Settings()));
                },
                tileColor: Colors.cyan,
                title: Text("UI settings"),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(),
      body: Center(
        child: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              "https://media.istockphoto.com/photos/panoramic-aerial-view-to-the-illuminated-cityscape-of-london-picture-id1313895046?b=1&k=20&m=1313895046&s=170667a&w=0&h=DYmffKDEbm-cQrk10rwhuTDziA5sMMypyddQjuCKVv4="),
        ),

        //  Container(
        //   height: 200,
        //   child: CircleAvatar(
        //     // radius: ,

        //     backgroundImage: AssetImage(""),
        //   ),
        //   width: 250,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //         bottomRight: Radius.circular(35), topLeft: Radius.circular(35)),
        //     color: Colors.amber,
        //     // border: BoxBorder.lerp(),
        //     // shape: BoxShape.circle,
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey,
        //         spreadRadius: 5,
        //         blurRadius: 7,
        //         offset: Offset(0, 3), // changes position of shadow
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
