// import 'dart:html';
import 'dart:io';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'im';

class ImageTaker extends StatefulWidget {
  @override
  State<ImageTaker> createState() => _ImageTakerState();
}

class _ImageTakerState extends State<ImageTaker> {
  // ImageTaker({Key? key}) : super(key: key);
  File? img;

  imgpic() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        img = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    print(img!.absolute);
  }

  @override
  Widget build(BuildContext context) {
    // print("image path : ${img!.absolute.path}");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              child: IconButton(
                  icon: Icon(Icons.camera_alt_rounded), onPressed: imgpic)),
          img != null
              ? Container(
                  child: Image.file(img!.absolute),
                )
              : Text("Loading........")
        ],
      ),
    );
  }
}
