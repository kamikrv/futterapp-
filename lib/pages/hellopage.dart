import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Login'),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(
            height: 15,
          ),
          //ElevatedButton(child: Text('Start'))
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}