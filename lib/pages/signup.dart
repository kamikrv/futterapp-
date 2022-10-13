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
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
        body:  Padding(
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
              TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'City:',
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
                onPressed: (){
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: const Text('Sing up'),
              )
            ]
        ),
    ));
  }
}
