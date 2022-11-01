import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Roof.kz'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.output),
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                }
                )
          ],
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                const SizedBox(
              width: 200,
              height: 15,
              ),
            Text('Your email: ${user.email!}', style: const TextStyle(fontSize: 30, color: Colors.grey ),)
              ]
        )
    )
    );
  }
}
