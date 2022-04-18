import 'package:flutter/material.dart';

class Ui2 extends StatelessWidget {
  var imglist = [
    "https://images.theconversation.com/files/388314/original/file-20210308-13-un5d1h.jpg?ixlib=rb-1.1.0&rect=40%2C0%2C3789%2C2578&q=45&auto=format&w=926&fit=clip",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Road_and_nature_at_Chairman_Para_road.jpg/250px-Road_and_nature_at_Chairman_Para_road.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Road_and_nature_at_Chairman_Para_road.jpg/250px-Road_and_nature_at_Chairman_Para_road.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Road_and_nature_at_Chairman_Para_road.jpg/250px-Road_and_nature_at_Chairman_Para_road.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkDnEM41wBbhuV1wpA9v4t0x-3jadRxy-uiw&usqp=CAU"
  ];
  var titlelist = ["Dhaka", "Chittagong", "Satkania", "Barisal" "Banshkhali"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: titlelist.length,
        itemBuilder: (context, index) =>
            Cardui(imglist[index], titlelist[index]),
      ),
    );
  }
}

class Cardui extends StatelessWidget {
  var img;
  var title;
  Cardui(this.img, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 200,
        // width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              // height: 200,
              // decoration: BoxDecoration(
              //     color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              // width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.network(
                  img,
                  height: 200,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
                child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
