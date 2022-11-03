import 'package:flutter/material.dart';
import 'package:helpa/helpa_widget.dart';
import 'package:helpa/otp_verification_screen.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HelpaWidget.appBar(
      //   'Log in',
      //   leadingWidget: const BackButton(color: Colors.black,)
      // ),
      appBar: AppBar(
        title: const Text('Log in', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: const BackButton(color: Colors.black,),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        children: [
          const Text('Welcome Back!'),
          const SizedBox(height: 20,),
          const Text('Email'),
         const  SizedBox(height: 8,),
          HelpaWidget.roundEdgeFormTextField(
              "Email",
              "",
              _emailController,
              TextInputType.text,
              "",
          ),
          const SizedBox(height: 14,),
          const Text('Password'),
          const SizedBox(height: 8,),
          HelpaWidget.roundEdgeFormTextField(
            "Password",
            "",
            _passwordController,
            TextInputType.text,
            "",
            // suffixIcon: Align(
            //   widthFactor: 1.0,
            //   heightFactor: 2.0,
            //   child: Text('Show'),
            // ),
          ),
          const SizedBox(height: 41,),
          HelpaWidget.PositiveButton(
              context, "LOG IN", () {},
              // bgColor: const Color(0xFFEBEBEB),
              // textColor: const Color(0xFFA3A5A9)
          ),
          const SizedBox(height: 20,),
          TextButton(
            onPressed: (){
              forgotPasswordScreen();
            },
            child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFF0A0A0A)),),
          )
        ],
      ),
    );
  }

  void forgotPasswordScreen(){
   // Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Otp()));
  }
}

