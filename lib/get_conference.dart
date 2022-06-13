import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/con_model.dart';
import 'con_list_page.dart';
import 'con_detail_page.dart';
import 'package:conference_app/Util/functions.dart' as func;

class GetConference extends StatefulWidget {
  const GetConference({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GetConference> createState() => _GetConferenceState();
}

class _GetConferenceState extends State<GetConference> {
  List<ConModel>? conmodel;

  List texts = ['adjsh', 'asdfa', 'asdf'];

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
                future: func.fetch(),
                builder: (context, AsyncSnapshot<List<ConModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Text("데이터가 없습니다.");
                  }
                  conmodel = snapshot.data!;
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: conmodel!
                        .map(
                          (e) =>
                          ConListPage(
                              title: e.location!,
                              subtitle: e.link!,
                              ontap:
                                  (conmodel) {
                                    func.pagemove(context, conmodel, e.location!, e.link!, e.start!, e.end!);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           ConDetailPage(
                                //             commodel: conmodel!,
                                //             location: e.location!,
                                //             link: e.link!,
                                //           )),
                                // );
                              }
                          ),
                    )
                        .toList(),
                    // const Text("sldkfjla"),
                  );
                }),
            // const Text('헬로'),
            // ...texts,
          ],
        ),
      ),
    );
  }
// Future<List<ConModel>> fetch() async {
//   final response = await http.get(Uri.parse(
//       'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json'));
//   Iterable jsonResponses = jsonDecode(response.body);
//   List<ConModel> con_model =
//   jsonResponses.map((e) => ConModel.fromJson(e)).toList();
//   return con_model;
// }
//
// void pagemove(String a, String b) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//         builder: (context) =>
//             ConDetailPage(
//               commodel: conmodel!,
//               location: a,
//               link: b,
//             )),
//   );
// }
}

// ListView.separated(separatorBuilder: (){},
// itemCount: conmodel.length,
// itemBuilder: (context, int index) {
// return Container(
// height: 50.0,
// child: Center(child: Text(conmodel[index].location!),),
// );
// },
//
// );
