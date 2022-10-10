import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                  style: const TextStyle(fontSize: 22, color: Colors.grey),
                  decoration: const InputDecoration(labelText: 'Name:'),
                  maxLines: 10,
                  minLines: 1,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  style: const TextStyle(fontSize: 22, color: Colors.grey),
                  decoration: const InputDecoration(labelText: 'Login:'),
                  maxLines: 2,
                  minLines: 1,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  style: const TextStyle(fontSize: 22, color: Colors.grey),
                  decoration: const InputDecoration(labelText: 'Password:'),
                  maxLines: 3,
                  minLines: 1,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  style: const TextStyle(fontSize: 22, color: Colors.grey),
                  decoration: const InputDecoration(labelText: 'Phone number:'),
                  maxLines: 2,
                  minLines: 1,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  }),
                const SizedBox(
                height: 15,
              ),
              ]
          ),
        ),
    );
  }
}
