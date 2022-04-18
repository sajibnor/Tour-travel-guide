import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ghuraghuri/controller/adminpnlCntr.dart';
import 'package:ghuraghuri/controller/controller.dart';
import 'package:ghuraghuri/untils/tost.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class Uploadplace extends StatefulWidget {
  Uploadplace({Key? key}) : super(key: key);

  @override
  State<Uploadplace> createState() => _UploadplaceState();
}

class _UploadplaceState extends State<Uploadplace> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  var nameCtrl = TextEditingController();

  var locationCtrl = TextEditingController();

  var descriptionCtrl = TextEditingController();

  var image1Ctrl = TextEditingController();

  var image2Ctrl = TextEditingController();

  var image3Ctrl = TextEditingController();

  var latCtrl = TextEditingController();

  var lngCtrl = TextEditingController();

  var startpointNameCtrl = TextEditingController();

  var endpointNameCtrl = TextEditingController();

  var priceCtrl = TextEditingController();

  var startpointLatCtrl = TextEditingController();

  var startpointLngCtrl = TextEditingController();

  var endpointLatCtrl = TextEditingController();

  var endpointLngCtrl = TextEditingController();

  var pathsCtrl = TextEditingController();

  chooseImage() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      // print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        String url = await ref.getDownloadURL();
        print(url);
        setState(() {
          urllist.add(url);
        });

        // then((value) {
        //   imgRef.add({'url': value});
        // print(value);
        i++;
        // });
      });
    }
    if (image1Ctrl.text.isNotEmpty) {
      urllist.add(image1Ctrl.text);
    }
    if (image2Ctrl.text.isNotEmpty) {
      urllist.add(image2Ctrl.text);
    }
    if (image3Ctrl.text.isNotEmpty) {
      urllist.add(image3Ctrl.text);
    }
    print(urllist);
  }

  bool uploading = false;
  double val = 0;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;
  List urllist = [];

  List<File> _image = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final Controller = Provider.of<AdminpnlCntr>(context);
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Consumer<AdminpnlCntr>(
        builder: (context, value, child) => Form(
            // key: formKey,
            child: ListView(
          children: <Widget>[
            SizedBox(
              height: h * 0.10,
            ),
            Text(
              'Place Details',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 20,
            ),
            // statesDropdown(),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: inputDecoration(
                  'Enter place title', 'Place title', 'Place title', nameCtrl),
              controller: nameCtrl,
              validator: (value) {
                if (value!.isEmpty) return 'Value is empty';
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: inputDecoration('Enter location name',
                  'Location name', 'Location name', locationCtrl),
              controller: locationCtrl,
              validator: (value) {
                if (value!.isEmpty) return 'Value is empty';
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter place details (Html or Normal Text)',
                  border: OutlineInputBorder(),
                  labelText: 'Place details',
                  contentPadding:
                      EdgeInsets.only(right: 0, left: 10, top: 15, bottom: 5),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey[300],
                      child: IconButton(
                          icon: Icon(Icons.close, size: 15),
                          onPressed: () {
                            descriptionCtrl.clear();
                          }),
                    ),
                  )),
              textAlignVertical: TextAlignVertical.top,
              minLines: 5,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: descriptionCtrl,
              validator: (value) {
                if (value!.isEmpty) return 'Value is empty';
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),

            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: TextFormField(
            //         decoration:
            //             inputDecoration('Enter Latitude', 'Latitude', ''),
            //         controller: latCtrl,
            //         keyboardType: TextInputType.number,
            //         validator: (value) {
            //           if (value!.isEmpty) return 'Value is empty';
            //           return null;
            //         },
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //       child: TextFormField(
            //         decoration: inputDecoration(
            //             'Enter Longitude', 'Longitude', 'Longitude'),
            //         keyboardType: TextInputType.number,
            //         controller: lngCtrl,
            //         validator: (value) {
            //           if (value!.isEmpty) return 'Value is empty';
            //           return null;
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),

            TextFormField(
              decoration: inputDecoration('Enter 1 image url link',
                  'https://www.', 'Image Link', image1Ctrl),
              controller: image1Ctrl,
              validator: (value) {
                if (value!.isEmpty) return 'Value is empty';
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: inputDecoration('Enter 2 image url link',
                  'https://www.', 'Image Link', image2Ctrl),
              controller: image2Ctrl,
              validator: (value) {
                if (value!.isEmpty) return 'Value is empty';
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: inputDecoration('Enter 3 image url link',
                  'https://www.', 'Image Link', image3Ctrl),
              controller: image3Ctrl,
              validator: (value) {
                if (value!.isEmpty) return 'Value is empty';
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),

            // Text(
            //   'Travel Guide Details',
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: TextFormField(
            //         decoration: inputDecoration(
            //             'Enter startpont name', 'Startpont name', ''),
            //         controller: startpointNameCtrl,
            //         validator: (value) {
            //           if (value!.isEmpty) return 'Value is empty';
            //           return null;
            //         },
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //       child: TextFormField(
            //         decoration: inputDecoration('Enter endpoint name',
            //             'Endpoint name', 'Endpoint name'),
            //         controller: endpointNameCtrl,
            //         validator: (value) {
            //           if (value!.isEmpty) return 'Value is empty';
            //           return null;
            //         },
            //       ),
            //     ),
            //   ],
            // ),

            // SizedBox(
            //   height: 20,
            // ),
            // TextFormField(
            //   decoration:
            //       inputDecoration('Enter travel cost', 'Price', 'Price'),
            //   keyboardType: TextInputType.number,
            //   controller: priceCtrl,
            //   validator: (value) {
            //     if (value!.isEmpty) return 'Value is empty';
            //     return null;
            //   },
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: TextFormField(
            //         decoration: inputDecoration('Enter startpoint latitude',
            //             'Startpoint latitude', 'latitude'),
            //         controller: startpointLatCtrl,
            //         keyboardType: TextInputType.number,
            //         validator: (value) {
            //           if (value!.isEmpty) return 'Value is empty';
            //           return null;
            //         },
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //       child: TextFormField(
            //         decoration: inputDecoration('Enter startpoint longitude',
            //             'Startpoint longitude', 'longitude'),
            //         keyboardType: TextInputType.number,
            //         controller: startpointLngCtrl,
            //         validator: (value) {
            //           if (value!.isEmpty) return 'Value is empty';
            //           return null;
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            // Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: TextFormField(
            //         decoration: inputDecoration('Enter endpoint latitude',
            //             'Endpoint latitude', 'Endpoint latitude'),
            //         controller: endpointLatCtrl,
            //         keyboardType: TextInputType.number,
            //         validator: (value) {
            //           if (value!.isEmpty) return 'Value is empty';
            //           return null;
            //         },
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //       child: TextFormField(
            //         decoration: inputDecoration('Enter endpoint longitude',
            //             'Endpoint longitude', 'Endpoint longitude'),
            //         keyboardType: TextInputType.number,
            //         controller: endpointLngCtrl,
            //         validator: (value) {
            //           if (value!.isEmpty) return 'Value is empty';
            //           return null;
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),

            TextFormField(
              decoration: InputDecoration(
                  hintText:
                      "Enter path list one by one by tapping 'Enter' everytime",
                  border: OutlineInputBorder(),
                  labelText: 'Paths list',
                  // helperText: "_helperText",
                  contentPadding:
                      EdgeInsets.only(right: 0, left: 10, top: 15, bottom: 5),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey[300],
                      child: IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 15,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            pathsCtrl.clear();
                          }),
                    ),
                  )),
              controller: pathsCtrl,
              onFieldSubmitted: (String value) {
                // if (value.length == 0) {

                //     _helperText = "You can't put empty item is the list";

                // } else {
                //   setState(() {
                //     paths.add(value);
                //     _helperText = 'Added ${paths.length} items';
                //     print(paths);
                //   });
                // }
              },
            ),

            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   child: paths.length == 0
            //       ? Center(
            //           child: Text('No path list were added'),
            //         )
            //       : ListView.builder(
            //           shrinkWrap: true,
            //           physics: NeverScrollableScrollPhysics(),
            //           itemCount: paths.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return ListTile(
            //               leading: CircleAvatar(
            //                 child: Text(index.toString()),
            //               ),
            //               title: Text(paths[index]),
            //               trailing: IconButton(
            //                   icon: Icon(Icons.delete_outline),
            //                   onPressed: () {
            //                     setState(() {
            //                       paths.remove(paths[index]);
            //                       _helperText = 'Added ${paths.length} items';
            //                     });
            //                   }),
            //             );
            //           },
            //         ),
            // ),
            SizedBox(
              height: 10,
            ),

            ListTile(
              title: Text("Chosse image from gellery"),
            ),
            Container(
              height: 200,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: GridView.builder(
                          itemCount: _image.length + 1,
                          // _image.length + 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2,
                                  // mainAxisSpacing: 2,
                                  // mainAxisExtent: 40,
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return index == 0
                                ? Center(
                                    child: IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () =>
                                            !uploading ? chooseImage() : null),
                                  )
                                : Container(
                                    // height: 10,
                                    // width: 20,
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(
                                              _image[index - 1],
                                            ),
                                            // alignment: Alignment.center,
                                            fit: BoxFit.cover)),
                                  );
                          }),
                    ),
                  ),
                  uploading
                      ? Center(
                          child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Text(
                                'Uploading...',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CircularProgressIndicator(
                              value: val,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            )
                          ],
                        ))
                      : Container(),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      uploading = true;
                    });
                    uploadFile().whenComplete(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Image uploading completed")));
                      uploading = false;
                    });
                  },
                  child: Text("Upload image")),
            ),

            SizedBox(
              height: 100,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton.icon(
                    icon: Icon(
                      Icons.remove_red_eye,
                      size: 25,
                      color: Colors.blueAccent,
                    ),
                    label: Text(
                      'Preview',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                    onPressed: () {})
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //     color: Colors.deepPurpleAccent,
            //     height: 45,
            //     child: uploadStarted == true
            //         ? Center(
            //             child: Container(
            //                 height: 30,
            //                 width: 30,
            //                 child: CircularProgressIndicator()),
            //           )
            //         : FlatButton(
            //             child: Text(
            //               'Upload Place Data',
            //               style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.w600),
            //             ),
            //             onPressed: () async {
            //               // handleSubmit();
            //             })),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(179, 109, 174, 60))),
                  onPressed: () {
                    Controller.uploadplace(
                        nameCtrl.text, locationCtrl.text, urllist);
                    // Controller.uploadplace(listOfimg, title, description, thumbnailImagelUrl, date, sourceUrl, timestamp)
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }

//   Widget statesDropdown() {
  InputDecoration inputDecoration(
          String _helperText, hintText, labelText, var onpress) =>
      InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          labelText: labelText,
          helperText: _helperText,
          contentPadding:
              EdgeInsets.only(right: 0, left: 10, top: 15, bottom: 5),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey[300],
              child: IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 15,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    onpress.clear();
                  }),
            ),
          ));
}
