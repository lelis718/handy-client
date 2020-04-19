import 'dart:developer';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final VoidCallback onReturning;

  ChatPage({this.onReturning});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with who needs help (WIP)'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Send a message!',
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
                  log(value);
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
                        'Message (WIP)',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      key: Key('ChatPage_RaisedButton_Back'),
                      color: Colors.blue,
                      onPressed: onReturning,
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
      ),
    );
  }
}
