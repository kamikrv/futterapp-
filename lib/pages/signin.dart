import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_app/pages/signup.dart';
import 'forget_password.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding:const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        width: 200,
                        height: 100,
                      ),
                      //icon of the house
                      const Icon(Icons.house,
                      size: 100,
                      color: Colors.grey,),
                      //label text
                      const Text('Roof.kz',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 40)
                      ),
                      const SizedBox(
                        width: 200,
                        height: 150,
                      ),
                      //email textfiled
                      TextFormField(
                          controller: _emailController,
                          decoration:  InputDecoration(
                            enabledBorder:  OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(Icons.person),
                            hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                            labelText: 'Email',
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
                          }
                          ),
                      const SizedBox(
                        width: 200,
                        height: 15,
                      ),
                      // password textfiled
                      TextFormField(
                          controller: _passwordController,
                          decoration:  InputDecoration(
                            enabledBorder:  OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Password',
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
                          }
                          ),
                      const SizedBox(
                        width: 200,
                        height: 15,
                      ),
                      // forgot password link
                      GestureDetector(
                        onTap: () { Navigator.push(context,
                            MaterialPageRoute(builder: (context){
                          return const ForgotPasswordPage();
                            }
                            ));
                          },
                          child: const Text('Forgot password?',
                            style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),)
                      ),
                      const SizedBox(
                        width: 200,
                        height: 15,
                      ),
                      //sign in button
                      ElevatedButton (
                        onPressed: signIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        ),
                        child: const Text('Sing in'),
                      ),
                      Padding (
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //text
                              const Text('Do not have an account? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              // sign up link
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SignUpPage() ),
                                  );
                                },
                                child: const Text(' sign up',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                )
            )
        )
    );
  }
}