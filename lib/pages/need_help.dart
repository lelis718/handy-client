import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:handyclientapp/model/help.dart';
import 'package:handyclientapp/services/device_info_service.dart';
import 'package:handyclientapp/services/help_service.dart';

import '../app_routes.dart';

class NeedHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What needs to be done?'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'I need help to do ....',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    style: BorderStyle.solid,
                    width: 10,
                  ),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'We need to know what do you neeed';
                }

                DeviceInfoServiceDefault().getDeviceInfo().then((deviceInfo) {
                  HelpService()
                      .askHelp(
                    Help(
                      message: value,
                      user: deviceInfo.uuid,
                    ),
                  )
                      .then((isSuccess) {
                    if (isSuccess) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: new Text("Help posted with successfully"),
                            content: new Text("Alert Dialog body"),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.helpSelector);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                });

                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Processing Data'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Ask Help',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
