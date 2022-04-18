// import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:ghuraghuri/model.dart/placemodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class AdminpnlCntr extends ChangeNotifier {
  // chooseImage() async {
  //   final XFile? pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   _image.add(File(pickedFile!.path));
  //   // setState(() {

  //   // });
  //   if (pickedFile == null) retrieveLostData();
  // }

  // Future<void> retrieveLostData() async {
  //   final LostData response = await picker.getLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   if (response.file != null) {
  //     _image.add(File(response.file!.path));
  //     // setState(() {

  //     // });
  //   } else {
  //     print(response.file);
  //   }
  // }

  // // @override
  // // void initState() {
  // //   super.initState();
  // //   imgRef = FirebaseFirestore.instance.collection('imageURLs');
  // // }

  // bool uploading = false;
  // double val = 0;
  // late CollectionReference imgRef;
  // late firebase_storage.Reference ref;

  // List<File> _image = [];
  // List get img => _image;

  // final picker = ImagePicker();

  // List urlL = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var _timestamp;
  var _date;

  // String? _collectionName;
  // String? get collectionName => _collectionName;

  uploadplace(String title, description, List imgurl

      // String title, description, thumbnailImagelUrl,
      //     date, sourceUrl, timestamp

      ) async {
    // // Future uploadFile() async {
    // int i = 1;

    // for (var img in _image) {
    //   // setState(() {

    //   // });
    //   val = i / _image.length;
    //   ref = firebase_storage.FirebaseStorage.instance
    //       .ref()
    //       .child('images/${Path.basename(img.path)}');
    //   await ref.putFile(img).whenComplete(() async {
    //     String url = await ref.getDownloadURL();
    //     print(url);
    //     urlL.add(url);

    //     // then((value) {
    //     //   imgRef.add({'url': value});
    //     // print(value);
    //     i++;
    //     // });
    //   });
    //   // }
    // }

    DateTime now = DateTime.now();
    String _d = DateFormat('dd MMMM yy').format(now);
    String _t = DateFormat('yyyyMMddHHmmss').format(now);
    _timestamp = _t;
    _date = _d;
    // notifyListeners();

    DocumentReference rawdata =
        await firestore.collection("place").doc(_timestamp);
    var update = {
      "title": title,
      "description": description,
      "img": imgurl,
      // thumbnailImagelUrl: thumbnailImagelUrl,
      // sourceUrl: sourceUrl,
      // date: date,
      "timestamp": _timestamp
    };

    //  Blog(
    //     title: title,
    //     description: description,
    //     // img: listOfimg,
    //     // thumbnailImagelUrl: thumbnailImagelUrl,
    //     // sourceUrl: sourceUrl,
    //     // date: date,
    //     timestamp: timestamp).toString();
    await rawdata.set(update);
    print(update);
  }
}
