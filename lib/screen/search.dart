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
                  blurRadius: 2,
                  offset: Offset(1, 1),
                  color: Colors.black12)
            ]),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Search Place",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 1, color: Colors.white10)),
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}


