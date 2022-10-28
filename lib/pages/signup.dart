import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}
final _formKey = GlobalKey<FormState>();

class SignUpPageState extends State {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();


  // Authenticate user
  Future signUp() async{
    // validation
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      //massage
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );
      usersDetails(
        nameController.text.trim(),
        int.parse(phoneController.text.trim()),
      );
    }
  }

  //adding users details
  Future usersDetails(String name, int phoneNumber) async{
    await FirebaseFirestore.instance.collection('usersD').add({
      'Name': name,
      'Phone  number': phoneNumber,
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                    //name textFiled
                    TextFormField(
                        controller: nameController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blue)
                          ),
                          prefixIcon: const Icon(Icons.drive_file_rename_outline),
                          labelText: 'Name:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
                        ),
                        //validation
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
                    //email textFiled
                    TextFormField(
                        controller: emailController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: const Icon(Icons.email),
                          labelText: 'e-mail:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
                        ),
                        //validation
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
                    //password textFiled
                    TextFormField(
                        controller: passwordController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'Password:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
                        ),
                        obscureText: true,
                        //validation
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
                    // confirm password textFiled
                    TextFormField(
                        controller: confirmPasswordController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'Confirm password:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
                        ),
                        obscureText: true,
                        //validation
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          }
                          //confirming password
                          if(confirmPasswordController.text != passwordController.text){
                            return 'Password does not match!';
                          }
                          return null;
                        }),
                    const SizedBox(
                      width: 200,
                      height: 15,
                    ),
                    //phone number textFiled
                    TextFormField(
                        controller: phoneController,
                        decoration:  InputDecoration(
                          enabledBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'Phone number:',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: const OutlineInputBorder(),
                        ),
                        //validation
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
                    // sign up button
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

