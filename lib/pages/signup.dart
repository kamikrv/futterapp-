import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

  @override
  _SignUpPageState createState() => _SignUpPageState();


class _SignUpPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'Имя',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Пароль',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],

          ),
        )
    );
  }
}
