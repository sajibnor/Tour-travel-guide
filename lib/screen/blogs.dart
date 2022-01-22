import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blogs",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.sort_down),
                    Icon(CupertinoIcons.refresh_bold),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 570,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => BlogItem(),
            ),
          )
        ],
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  const BlogItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/e2/f8/43/longest-sea-beach-in.jpg?w=700&h=-1&s=1",
                  fit: BoxFit.cover,
                  // height: 200,
                  // width: double.maxFinite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cox's Bazar 2022: Best of Cox's Bazar, Bangladesh ",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Private Tour: Archeology, Culture, Tribes, Old Buddhist Heritage and Beaches Bangladesh Heritage Tour ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timelapse),
                          Text("19 oct 2022"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.heart),
                          Text("0"),
                        ],
                      ),
                    ],
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
