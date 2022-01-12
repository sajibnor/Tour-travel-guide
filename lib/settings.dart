import 'package:flutter/material.dart';
import 'package:ghuraghuri/controller/controller.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mycontroller = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<Controller>(
            builder: (context, mycontroller, child) => Text(
              "Bangladesh forms the larger and eastern part of the Bengal region.[17] According to the ancient Indian texts, Rāmāyana and Mahābhārata, the Vanga Kingdom, one of the namesakes of the Bengal region, was a strong naval power. In the ancient and classical periods of the Indian subcontinent, the territory was home to many principalities, including the Pundra, Gangaridai, Gauda, Samatata, and Harikela. It was also a Mauryan province under the reign of Ashoka. The principalities were notable for their overseas trade, contacts with the Roman world, the export of fine muslin and silk to the Middle East",
              style: TextStyle(fontSize: mycontroller.size.toDouble()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<Controller>(
                builder: (context, mycontroller, child) {
                  return IconButton(
                      onPressed: mycontroller.increment, icon: Icon(Icons.add));
                },
              ),
              Consumer<Controller>(
                  builder: (context, mycontroller, child) => IconButton(
                      onPressed: mycontroller.drecrement,
                      icon: Icon(Icons.minimize))),
            ],
          ),
          Consumer<Controller>(
            builder: (context, mycontroller, child) =>
                Text("${mycontroller.size}"),
          ),
          Consumer<Controller>(
            builder: (_, mycontroller, c) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: mycontroller.controller,
              ),
            ),
          ),
          TextButton(onPressed: mycontroller.setname, child: Text("setname"))
        ],
      ),
    );
  }
}
