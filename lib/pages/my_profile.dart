import 'package:flutter/material.dart';
import '../models/signUp.dart';
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
        body:Padding(
        padding:const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
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
            const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
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
              const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
            ),
          child: const Text('Sing up'),
        )
        ]
    ),
        )
    );
  }

}