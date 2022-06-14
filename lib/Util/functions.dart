import 'dart:convert';
import 'package:conference_app/Model/con_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../con_detail_page.dart';
import 'package:intl/intl_browser.dart';
import 'package:conference_app/Model/con_model.dart';

// class Functions {
  List<ConModel>? conmodel;

  Future<List<ConModel>> fetch() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json'));
    Iterable jsonResponses = jsonDecode(response.body);
    List<ConModel> toConModel =
    jsonResponses.map((e) => ConModel.fromJson(e)).toList();
    return toConModel;
  }

  void pagemove(BuildContext context, ConModel conModel, String a, String b, String c, String d) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ConDetailPage(
                commodel: conModel,
                location: a,
                link: b,
                start: c,
                end: d,
              )),
    );
  }

  void dateTime(String start, String end){

    DateFormat dateFormat = DateFormat('yMMMd');
    String startDate = dateFormat.format(DateTime.parse(start));
    String endDate = dateFormat.format(DateTime.parse(end));
  }
// }