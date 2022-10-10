import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/logins.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
  }


class _ProfileTabState extends State<ProfileTab> {
List<MyUser> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Roof.kz'),
        centerTitle: true,
      ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
        ElevatedButton (
          onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              padding:
              const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            ),
          child: const Text('Sing in'),
        ),
        ElevatedButton (
          onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              padding:
              const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            ),
          child: const Text('Sing up'),
        )
        ]
    ),
    );
  }

}