import 'package:flutter/material.dart';
import '../models/logins.dart';
import '../pages/signup.dart';
import '../pages/signin.dart';

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
            const SizedBox(
              width: 200,
              height: 15,
            ),
        ElevatedButton (
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInPage() ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding:
            const EdgeInsets.symmetric(horizontal: 170, vertical: 10),
          ),
          child: const Text('Sing in'),
        ),
            const SizedBox(
              width: 200,
              height: 15,
            ),
        ElevatedButton (
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SignUpPage()),
            );
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding:
              const EdgeInsets.symmetric(horizontal: 169, vertical: 10),
            ),
          child: const Text('Sing up'),
        )
        ]
    ),
    );
  }

}