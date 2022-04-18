import 'package:flutter/material.dart';
import 'package:ghuraghuri/controller/apiservices.dart';

class Apiui extends StatefulWidget {
  @override
  State<Apiui> createState() => _ApiuiState();
}

class _ApiuiState extends State<Apiui> {
  Apiservices apiservices = Apiservices();

  List data = [];
  var lst;

  getdata() async {
    data = await apiservices.getdata();
    setState(() {
      data;
    });
  }

  @override
  void initState() {
    this.getdata();
    // print(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [...data.map((e) => Text("${e["id"]}"))]

            // List.generate(
            //     data.length,
            //     (index) => Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Card(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Card(
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Text("${data[index]["userId"]}"),
            //                   ),
            //                 ),
            //                 Card(
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Text("${data[index]["id"]}"),
            //                   ),
            //                 ),
            //                 Card(
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Text("${data[index]["title"]}"),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         )),
            ));
  }
}
