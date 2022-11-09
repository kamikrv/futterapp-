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
        title: Text('${user?.email!}',
          ),
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
                Image(
                image: NetworkImage('https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
        ),

                  const SizedBox(
                    width: 100,
                    height: 15,
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
