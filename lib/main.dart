import 'package:flutter/material.dart';
import 'package:ghuraghuri/controller/adminpnlCntr.dart';
import 'package:ghuraghuri/controller/controller.dart';
import 'package:ghuraghuri/controller/getdatacontroler.dart';
import 'package:ghuraghuri/screen/animation.dart';
import 'package:ghuraghuri/screen/apiui.dart';
import 'package:ghuraghuri/screen/blogs.dart';
import 'package:ghuraghuri/screen/hero.dart';
import 'package:ghuraghuri/screen/home.dart';
import 'package:ghuraghuri/screen/imagepicker.dart';
import 'package:ghuraghuri/screen/introduction.dart';
import 'package:ghuraghuri/screen/loadingimage.dart';
import 'package:ghuraghuri/screen/stack.dart';
import 'package:ghuraghuri/screen/t.dart';
import 'package:ghuraghuri/screen/travelguid.dart';
import 'package:ghuraghuri/screen/ui2.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

//  01660185714
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => GetdataCntr())),
        ChangeNotifierProvider<AdminpnlCntr>(
            create: ((context) => AdminpnlCntr())),
        ChangeNotifierProvider<Controller>(create: ((context) => Controller())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroductionPage(),
      ),
    );
  }
}
