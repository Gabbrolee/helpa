import 'package:flutter/material.dart';
import 'package:helpa/helpa_widget.dart';

import '../reset_password_login.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
              title: const Text('Forgot Password', style: TextStyle(color: Colors.black),
         ),
          centerTitle: true,
           leading: const BackButton(
           color: Colors.black,
      ),
      backgroundColor: Colors.white,
    ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 30),
        child: Column(
          children: [
            Container(
             //  margin: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  const Text('Enter your email address to reset your password.'),
                  const SizedBox(height: 33,),
                  const Text('Email'),
                  const SizedBox(height: 8,),
                  HelpaWidget.roundEdgeFormTextField(
                    "Email",
                    "",
                    _emailController,
                    TextInputType.text,
                    "",
                  ),
                  const SizedBox(height: 350,),
                ],
              ),
            ),
              HelpaWidget.PositiveButton(
                context, "RESET", () {
                  resetPasswordLogin(context);
              },
                bgColor: const Color(0xFFEBEBEB),
                textColor: const Color(0xFFA3A5A9)
            ),
          ],
        ),
      ),
    );
  }

  void resetPasswordLogin(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordLogin()));
  }
}

