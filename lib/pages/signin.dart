import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Sign In'),
    centerTitle: true,
    ),
      body: Padding(
      padding:const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: 200,
            height: 15,
          ),
          TextFormField(
            //controller: ,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              labelText: 'Login',
              border: OutlineInputBorder(),
            ),
            validator: (value){
              if (value == null || value.isEmpty) {
               return 'Field is required';
               }
               return null;
            }),
          const SizedBox(
            width: 200,
            height: 15,
          ),
          TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
                obscureText: true,
                validator: (value){
                 if (value == null || value.isEmpty) {
                   return 'Field is required';
                 }
                 return null;
              }),
          const SizedBox(
            width: 200,
            height: 15,
          ),
          ElevatedButton (
            onPressed: () {
            Navigator.pop(context);
    },

            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding:
              const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            ),
             child: const Text('Sing in'),
    )
        ],
    )));
  }
}