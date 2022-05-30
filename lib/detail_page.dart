import 'package:flutter/material.dart';
import 'Model/con_model.dart';
import 'package:url_launcher/link.dart';


class DetailPage extends StatelessWidget {
  List <ConModel> commodel ;
  DetailPage({Key? key, required this.commodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:
      const Text('Detail Page'),
    ),
      body: ListView( children: [
        Text(commodel[0].name!),
        // ElevatedButton(
        //   onPressed: _launchUrl,
        //   child: Text(commodel[0].link!),
        // ),
        Text(commodel[0].link!),
      ],
      ),
    );
  }
}
