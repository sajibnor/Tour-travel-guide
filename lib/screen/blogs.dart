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
              height: 160,
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

class _ItemList extends StatelessWidget {
  // final Blog d;
  // const _ItemList({Key key, @required this.d}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(0, 3))
              ]),
          child: Wrap(
            children: [
              Hero(
                tag: 'blog d.timestamp',
                child: Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/e2/f8/43/longest-sea-beach-in.jpg?w=700&h=-1&s=1",
                        fit: BoxFit.cover,
                      )
                      // CustomCacheImage(imageUrl: d.thumbnailImagelUrl),
                      ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "d.title",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        " HtmlUnescape().convert(parse(d.description).documentElement.text)",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700])),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "d.date",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Spacer(),
                        Icon(
                          Icons.favorite,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "d.loves".toString(),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {}
        //  nextScreen(context, BlogDetails(blogData: d, tag: 'blog${d.timestamp}'))
        );
  }
}
