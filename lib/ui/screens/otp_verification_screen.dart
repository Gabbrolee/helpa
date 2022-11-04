import 'package:flutter/material.dart';
import 'package:helpa/utility/helpa_widget.dart';

import 'new_password_screen.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification', style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: ()=> Navigator.pop(context),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 33, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Check Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                     fontSize: 20
                  ),
                ),
               const SizedBox(height: 10,),
               const Text("We,ve sent a 4-digit confirmation code to \n"
                    "08131889558 Make sure you enter correct code.",
                 style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.w400
                 ),
                ),
               const SizedBox(height: 54,),
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                   // color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(first: true, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: true),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 33,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text("Didn’t recieve code?"),
                  SizedBox(width: 3,),
                      TextButton(
                        onPressed: (){},
                        child: const Text('Resend Code',
                          style: TextStyle(
                              color: Color(0xFF0A0A0A),
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      )
                ]
                ),
                const SizedBox(
                  height: 86,
                ),
                HelpaWidget.PositiveButton(context, "VERIFY",
                        () {setNewPassword();}
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void setNewPassword(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPasswordScreen()));
  }

  Widget _textFieldOTP({bool? first, last}) {
    return Container(
      height: 48,
      width: 54,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          obscureText: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.orange),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
