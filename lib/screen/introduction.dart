import 'package:flutter/material.dart';
import 'package:ghuraghuri/screen/hero.dart';
import 'package:ghuraghuri/screen/home.dart';
import 'package:introduction_screen/introduction_screen.dart';
import './home.dart';

class IntroductionPage extends StatelessWidget {
  // const IntroductionPage({Key? key}) : super(key: key);
  List<PageViewModel> page = [
    PageViewModel(
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.orange),
          bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
        title: "Title of first page",
        body:
            "Here you can write the description of the page, to explain someting...",
        image: Center(
            child: Image.network(
                "https://image.shutterstock.com/image-photo/coxs-bazar-chittagong-bangladesh-6172017-260nw-1189314049.jpg"))),
    PageViewModel(
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.orange),
          bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
        title: "সাজেক ভ্যালী",
        body: "সাজেক ভ্যালি প্যাকেজ ৩ রাত ২ দিন | ফ্যামিলি ও ফিমেই.......",
        image: Center(
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCtQkejAyvAs8C2oKJd-WZyMdXcLzXTT8lgQ&usqp=CAU"))),
    PageViewModel(
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
      title: "সাজেক ভ্যালী",
      body:
          "তারিত » আদার ব্যাপারী adarbepari.com সাজেক ভ্রমণ গাইড - থাকা, খাওয়া, যাতায়াত, খরচ সব তথ্য (২০২১)সাজেক ভ্রমণ গাইড - থাকা, খাওয়া, যাতায়াত, খরচ সব তথ্য ",
      image: Image.network(
        "https://sgp1.digitaloceanspaces.com/cosmosgroup/news/3598001_Rangamati%20Pic-28-08-2020-1.jpg",
        height: 250,
        fit: BoxFit.cover,
      ),
      footer: ElevatedButton(onPressed: () {}, child: Text("See Details")),
      // titleWidget: Text("data"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: page,
      onDone: () {
        Navigator.of(context).push(pageroute(Home()));
      },
      next: Icon(Icons.arrow_forward),
      done: Text("Done"),
      skip: Text("Skip"),
      showSkipButton: true,
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.lime,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 8.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
