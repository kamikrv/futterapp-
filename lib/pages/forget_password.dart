import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context){
            return const AlertDialog(
              content: Text('Password reset link sent! Check your email!'),
            );
          });
    }on FirebaseAuthException catch (e){
      print(e);
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              content: Text(e.message.toString()),
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Forgot Password'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const SizedBox(
                    width: 200,
                    height: 15,
                  ),
                  const Text(
                    'Enter your email and we will send you a password reset link',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                   const SizedBox(
                    width: 200,
                    height: 15,
                  ),
                  TextFormField(
                      controller: _emailController,
                      decoration:  InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: const Icon(Icons.person),
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                        labelText: 'Email',
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      }
                  ),
                  const SizedBox(
                    width: 200,
                    height: 15,
                  ),
                  MaterialButton(
                      onPressed: passwordReset,
                      color: Colors.blue,
                      child: const Text('Reset password',
                        style: TextStyle(color: Colors.white),))
                ]
            )
        )
    );
  }
}
