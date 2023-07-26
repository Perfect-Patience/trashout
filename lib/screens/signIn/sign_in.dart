import 'package:flutter/material.dart';
import 'package:trashout/components/loginButton.dart';

import '../../components/loginInputField.dart';
import '../../components/squaretile.dart';
import '../home/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});



  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70,),
              Container(
                  width: 100,
                  height: 100,
                  decoration:  const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00bf63),
                  ),
                  child:const Center(child:  Icon(Icons.person, size: 90, color: Colors.white,))),
              const SizedBox(height: 40,),
              // Text("Welcome Back User",
              //   style: TextStyle(color: Colors.grey[700]),
              // ),
              const SizedBox(height: 20,),
              LoginInputField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 20.0,),
              LoginInputField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.fromLTRB(25, 0 , 25, 0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    )
                    )
                  ],
                ),
              ),
              const SizedBox(height:55,),
              LoginButton(
                      onTap: () { Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const HomePage()
                          ));
              }),

             const  SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'OR ',
                        style: TextStyle(color: Colors.grey[700],
                        fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // google + facebook sign in buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: 'assets/google_logo.png'),

                  SizedBox(width: 25),

                  // apple button
                  SquareTile(imagePath: 'assets/facebook_logo.png')
                ],
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

