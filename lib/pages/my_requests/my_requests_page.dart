import 'package:flutter/material.dart';
import 'package:handyclientapp/model/help.dart';
import 'package:handyclientapp/pages/my_requests/widgets/help_request.dart';

class MyRequestsPage extends StatelessWidget {
  final List<Help> helpRequests;

  MyRequestsPage({Key key, @required this.helpRequests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Manage your requests... ${this.helpRequests.length}")),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: this.helpRequests.map((item) {
              return HelpRequest(
                helpRequest: item
              );
            }).toList(),
          ),
        ));
  }
}
