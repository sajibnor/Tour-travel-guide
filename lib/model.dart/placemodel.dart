import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Place {
  String? title;
  String? locationName;
  // String? location;
  // double? latitude;
  // double? longitude;
  String? description;
  List? imageUrl;
  // String? imageUrl2;
  // String? imageUrl3;
  // int? loves;
  // int? commentsCount;
  // String? date;
  String? timestamp;

  Place(
      {required this.title,
      this.locationName,
      this.imageUrl,
      // this.latitude,
      // this.longitude,
      this.description,
      // this.imageUrl1,
      // this.imageUrl2,
      // this.imageUrl3,
      // this.loves,
      // this.commentsCount,
      // this.date,
      required this.timestamp});

  factory Place.fromFirestore(DocumentSnapshot d) {
    return Place(
      title: d['state'],
      locationName: d['place name'],
      // location: d['location'],
      // latitude: d['latitude'],
      // longitude: d['longitude'],
      description: d['description'],
      imageUrl: d['img'],
      // imageUrl2: d['image-2'],
      // imageUrl3: d['image-3'],
      // loves: d['loves'],
      // commentsCount: d['comments count'],
      // date: d['date'],
      timestamp: d['timestamp'],
    );
  }
}
