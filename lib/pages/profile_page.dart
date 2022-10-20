import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Roof.kz'),
    centerTitle: true,
        ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              ElevatedButton(
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                  },
                child: const Text('Sing out'),
              ),
            ]
        )
      )
    );
  }
}
