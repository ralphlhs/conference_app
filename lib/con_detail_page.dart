import 'package:flutter/material.dart';
import 'Model/con_model.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:intl/intl.dart";
import 'package:conference_app/Util/extension/date_time.dart';

class ConDetailPage extends StatelessWidget {
  ConModel? commodel;
  String location;
  String link;
  String? start;
  String? end;

  ConDetailPage({
    Key? key,
    this.commodel,
    required this.location,
    required this.link,
    required this.start,
    required this.end,
  }) : super(key: key);

  void _launchUrl() async {
    final Uri _url = Uri.parse(link);
    if (!await launchUrl(_url)) throw 'Could not launch';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              commodel!.name!,
              style: const TextStyle(fontSize: 15.0),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              DateTime.parse(commodel!.start!).toyMMMd() +' '+
                  DateFormat.yMMMd().format(DateTime.parse(end!)),
              style: const TextStyle(fontSize: 15.0),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              start! + ' - ' + end!,
              style: const TextStyle(fontSize: 15.0),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: _launchUrl,
                child: Text(
                  link,
                  style: const TextStyle(fontSize: 17.0),
                )),
          ],
        ),
      ),
    );
  }
}
