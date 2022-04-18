// import 'dart:html';

import 'package:flutter/material.dart';

class SearchUi extends StatelessWidget {
  const SearchUi({
    Key? key,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2, offset: Offset(1, 1), color: Colors.black12)
            ]),
        child: TextField(
          onTap: () {
            showSearch(context: context, delegate: Search());
          },
          decoration: InputDecoration(
              hintText: "Search Place",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: Colors.white10)),
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}

class Search extends SearchDelegate {
  var i;
  var l = [
    "Barguna",
    "Barisal",
    "Bhola",
    "Jhalokati",
    "Patuakhali",
    "Pirojpur",
    "Bandarban",
    "Brahmanbaria",
    "Chandpur",
    "Chittagong",
    "Comilla",
    "Coxs Bazar",
    "Feni",
    "Khagrachhari",
    "Lakshmipur",
    "Noakhali",
    "Rangamati",
    "Dhaka",
    "Faridpur",
    "Gazipur",
    "Gopalganj",
    "Kishoreganj",
    "Madaripur",
  ];
  var recent = [
    "Dhaka",
    "Faridpur",
    "Gazipur",
    "Gopalganj",
    "Kishoreganj",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return MyCard(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final showlist = query.isEmpty
        ? recent
        : l
            .where((element) => element.startsWith(query.toUpperCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            i = index;
            showResults(context);
            print("object");
            query.contains(showlist[index]);
            print(query.contains(showlist[index]));
            query = showlist[index];
          },
          leading: Icon(Icons.location_city),
          title: Text("${showlist[index]}")
          //  RichText(
          //   text: TextSpan(
          //     text: title,
          //     style:
          //         DefaultTextStyle.of(context).style.copyWith(color: Colors.green),
          //   ),
          // ),
          ),
      itemCount: showlist.length,
    );
  }
}

class MyCard extends StatelessWidget {
  // const MyCard({ Key? key }) : super(key: key);
  MyCard(this.title);
  var title = "";
  // Function ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {}, leading: Icon(Icons.location_city), title: Text(title)
        //  RichText(
        //   text: TextSpan(
        //     text: title,
        //     style:
        //         DefaultTextStyle.of(context).style.copyWith(color: Colors.green),
        //   ),
        // ),
        );
  }
}
