import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Apiservices {
  final baseurl = "jsonplaceholder.typicode.com";

  Future getdata() async {
    var response = await http.get(Uri.https(baseurl, "albums"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    if (response.statusCode == 404) {
      return Text("Data is not found");
    }
  }
}
