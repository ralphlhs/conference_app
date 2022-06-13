import 'package:conference_app/Model/con_model.dart';
import 'package:flutter/material.dart';

class ConListPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final ConModel? conModel;
  final Function(ConModel)? ontap;

  const ConListPage({Key? key, this.title, this.subtitle, this.conModel, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap!(conModel!),
      title: Text(title!),
      subtitle: Text(subtitle!),
    );
  }
}
