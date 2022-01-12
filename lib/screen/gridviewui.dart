import 'package:flutter/material.dart';
class GriedviewPlace extends StatelessWidget {
  const GriedviewPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 150,
          width: 400,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 2),
            itemBuilder: (context, index) => Container(
              height: 100,
              width: 200,
              color: Colors.cyan,
            ),
            itemCount: 10,
          )),
    );
  }
}