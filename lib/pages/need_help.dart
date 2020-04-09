import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeedHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        appBar: AppBar(
          title: Text('What needs to be done?'),
        ),
        body: MyCustomForm(),
      ),
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
    return Form(
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
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Ask Help'),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
                  },
                  child: Text('Back'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
