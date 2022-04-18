import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

nextPage(context, var pagename) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => pagename));
}
