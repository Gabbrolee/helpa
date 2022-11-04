import 'package:flutter/material.dart';

import 'account_verification_screen.dart';
import '../../utility/helpa_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _fNameController = TextEditingController();
  TextEditingController _lNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 34),
              child: Text(
                  "Create account",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name"),
                  SizedBox(height: 8,),
                  HelpaWidget.roundEdgeFormTextField(
                    "Enter Name",
                    "",
                    _fNameController,
                    TextInputType.text,
                    "",
                  ),
                  const SizedBox(height: 15,),
                  const Text("Last Name"),
                  const SizedBox(height: 8,),
                  HelpaWidget.roundEdgeFormTextField(
                    "Enter last Name",
                    "",
                    _lNameController,
                    TextInputType.text,
                    "",
                  ),
                  const SizedBox(height: 15,),
                  const Text("Email"),
                  const SizedBox(height: 8,),
                  HelpaWidget.roundEdgeFormTextField(
                    "Enter email",
                    "",
                    _emailController,
                    TextInputType.text,
                    "",
                  ),
                  const SizedBox(height: 15,),
                  const Text("Phone Number"),
                  const SizedBox(height: 8,),
                  HelpaWidget.roundEdgeFormTextField(
                    "Enter phone number",
                    "",
                    _phoneNumberController,
                    TextInputType.text,
                    "",
                  ),
                  const SizedBox(height: 15,),
                  const Text("Password"),
                  const SizedBox(height: 8,),
                  HelpaWidget.roundEdgeFormTextField(
                    "Enter password",
                    "",
                    _passwordController,
                    TextInputType.text,
                    "",
                  ),
                  const SizedBox(height: 37,),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: const Text(
                          "By selecting one or the other, you are agreeing to the\n"
                          "                 Terms of Services & Privacy Policy"
                      )),
                  const SizedBox(height: 17,),
                  HelpaWidget.PositiveButton(context, "SIGN UP", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountVerificationScreen()));
                  })
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}

