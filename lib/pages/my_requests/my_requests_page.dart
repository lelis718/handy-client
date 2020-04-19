import 'package:flutter/material.dart';
import 'package:handyclientapp/model/help.dart';
import 'package:handyclientapp/pages/my_requests/widgets/help_request.dart';

class MyRequestsPage extends StatelessWidget {
  final List<Help> helpRequests;

  MyRequestsPage({Key key, @required this.helpRequests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this.helpRequests.map((item) {
        return HelpRequest(
          helpRequest: item,
          onMarkSomeoneHelping: null, //
          onPeopleHelping: null, //
          onResolveHelp: null, //
        );
      }).toList(),
    );
  }
}
