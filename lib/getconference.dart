import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/con_model.dart';
import 'detail_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<ConModel>> fetch() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json'));
    Iterable jsonResponses = jsonDecode(response.body);
    List<ConModel> conmodel =
        jsonResponses.map((e) => ConModel.fromJson(e)).toList();
    return conmodel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<ConModel>>(
                future: fetch(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Text("데이터가 없습니다.");
                  }
                  List<ConModel> conmodel = snapshot.data!;
                  return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: conmodel
                          .map(
                            (e) =>
                                InkWell(onTap: () {Navigator.push( context,
                                MaterialPageRoute(builder: (context) => DetailPage(commodel: conmodel,)),
                                );}, child: Text(e.location!)),
                          )
                          .toList());
                })
          ],
        ),
      ),
    );
  }
}
