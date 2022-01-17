import 'package:flutter/material.dart';
import 'package:ghuraghuri/controller/controller.dart';
import 'package:ghuraghuri/screen/home.dart';
import 'package:ghuraghuri/screen/stack.dart';
import 'package:ghuraghuri/screen/t.dart';
import 'package:ghuraghuri/screen/travelguid.dart';
import 'package:ghuraghuri/screen/ui2.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Controller();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Travelguide(),
      ),
    );
  }
}
