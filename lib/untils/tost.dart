import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

// void t(String msg) {
//   Fluttertoast.showToast(
//       msg: msg
//       //  "This is Center Short Toast"
//       ,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.SNACKBAR,
//       // timeInSecForIosWeb: 1,

//       backgroundColor: Colors.red,
//       textColor: Colors.blue,
//       fontSize: 16.0);
// }

// sort length
void openToast(context, message) {
  Toast.show(message,
      backgroundColor: Colors.white,
      gravity: Toast.center,
      backgroundRadius: 20,
      duration: Toast.lengthShort);
}

//long length
// void openToast1(context, message) {
//   Toast.show(message, context,
//       // textColor: Colors.white,
//       gravity: Gra,
//       backgroundRadius: 20,
//       duration:  Toast.lengthShort);
// }
