import 'package:flutter/material.dart';
import 'package:github_app/models/signUp.dart';

import 'home.dart';
export 'package:github_app/models/signUp.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final loginController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
        body: Form(
        key: _formKey,
        child: Padding(
        padding:const EdgeInsets.fromLTRB(8, 16, 8, 16),
        child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                width: 200,
                height: 15,
              ),
              TextFormField(
              decoration: const InputDecoration(
              prefixIcon: Icon(Icons.drive_file_rename_outline),
              labelText: 'Name:',
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
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Login:',
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
                    prefixIcon: Icon(Icons.email),
                    labelText: 'e-mail:',
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
                    prefixIcon: Icon(Icons.password),
                    labelText: 'Password:',
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
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Phone number:',
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
              ElevatedButton (
                onPressed: ()
                async {
                  final house = MyUser(
                    name: nameController.value.text,
                    login: loginController.value.text,
                    email: emailController.value.text,
                    password: passwordController.value.text,
                    phone: phoneController.value.text,
                  );
                  if (_formKey.currentState!.validate()) {
                   _formKey.currentState!.save();
                     ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                   nameController.clear();
                   loginController.clear();
                   emailController.clear();
                   passwordController.clear();
                   phoneController.clear();
                }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>  Home()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text('Sing up'),
              ),
            ]
        ),
    )));
  }
}
