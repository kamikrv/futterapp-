import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forget_password.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final user = FirebaseAuth.instance.currentUser;
  late final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Roof.kz'),
    centerTitle: true,
            actions: <Widget>[
        IconButton(
        icon: const Icon( Icons.output),
      onPressed: () async {
        FirebaseAuth.instance.signOut();
      }),
        ]),
        body: Padding(
                padding:const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Column(
                  children: [
                  const SizedBox(
                    width: 100,
                    height: 15,
                  ),
                      Text('Your email: ${user?.email!}',
                        style: const TextStyle(
                            height: 2,
                            fontSize: 20,
                            color: Colors.black45),),
                  const SizedBox(
                    width: 100,
                    height: 70,
                  ),
                  const Text('Do not remember your password?',
                      style: TextStyle(
                      height: 2,
                      fontSize: 20,
                      color: Colors.black45),),
                  GestureDetector(
                    onTap: () { Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return const ForgotPasswordPage();
                        })
                    );
                  },
                    child: const Text('You  can recover your password',
                      style: TextStyle(
                          height: 2,
                          fontSize: 20,
                          color: Colors.blue),),
                    ),
                  const SizedBox(
                    width: 100,
                    height: 15,
                  ),
                ]
            )
        )
    );
  }
}
