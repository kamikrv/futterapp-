import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final phoneController = TextEditingController();

  Future signUp() async{
    if(passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      usersDetails(
        nameController.text.trim(),
        int.parse(phoneController.text.trim()),
      );
    }
  }

  Future usersDetails(String name, int phoneNumber) async{
    await FirebaseFirestore.instance.collection('usersD').add({
      'Name': name,
      'Phone  number': phoneNumber,
    });
  }

  bool passwordConfirmed(){
    if(passwordController.text.trim() == confirmpasswordController.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Sign Up'),
          centerTitle: true,
        ),
        body: Form(
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
                        controller: nameController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          prefixIcon: const Icon(Icons.drive_file_rename_outline),
                          labelText: 'Name:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
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
                        controller: emailController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'e-mail:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
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
                        controller: passwordController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'Password:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
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
                    TextFormField(
                        controller: confirmpasswordController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'Confirm password:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
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
                    TextFormField(
                        controller: phoneController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'Phone number:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
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
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 20
                        ),
                      ),
                      child: const Text('Sing up'),
                    ),
                  ]
              ),
            )
        )
    );
  }
}
