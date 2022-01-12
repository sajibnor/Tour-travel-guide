import 'package:flutter/material.dart';
import 'package:ghuraghuri/controller/controller.dart';
import 'package:provider/provider.dart';

class Uione extends StatelessWidget {
  const Uione({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Consumer<Controller>(
            builder: (context, mycontroller, child) =>
                Text("${mycontroller.size}"),
          ),
          Consumer<Controller>(
            builder: (context, mycontroller, child) =>
                Text("${mycontroller.name}"),
          ),
        ],
      ),
    );
  }
}
