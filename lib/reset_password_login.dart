import 'package:flutter/material.dart';

import 'helpa_widget.dart';
class ResetPasswordLogin extends StatefulWidget {
  const ResetPasswordLogin({Key? key}) : super(key: key);

  @override
  State<ResetPasswordLogin> createState() => _ResetPasswordLoginState();
}

class _ResetPasswordLoginState extends State<ResetPasswordLogin> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password', style: TextStyle(color: Colors
            .black),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            left: 16, right: 16, top: 40, bottom: 30),
        child: Column(
          children: [
            Container(
              //  margin: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Enter your email address to reset your password.'),
                  const SizedBox(height: 33,),
                  const Text('Email'),
                  const SizedBox(height: 8,),
                  HelpaWidget.roundEdgeFormTextField(
                    "joshosazuwa@yahoo.com",
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
                context, "LOGIN", () {
              //  resetPasswordLogin(context);
            },
                // bgColor: const Color(0xFFEBEBEB),
                // textColor: const Color(0xFFA3A5A9)
            ),
          ],
        ),
      ),
    );
  }
}