import 'package:flutter/material.dart';
import 'package:helpa/utility/helpa_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set New Password', style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: ()=> Navigator.pop(context),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
             margin: const EdgeInsets.only(left: 16, right: 16, top: 90),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text("New Password"),
                 const SizedBox(height: 5,),
                 HelpaWidget.roundEdgeFormTextField(
                     "Password",
                     "",
                     _passwordController,
                     TextInputType.text,
                     ""
                 ),
                 const SizedBox(height: 20,),
                 const Text("Confirm Password"),
                 const SizedBox(height: 5,),
                 HelpaWidget.roundEdgeFormTextField(
                     "Password",
                     "",
                     _passwordController,
                     TextInputType.text,
                     ""
                 ),
                 const SizedBox(height: 100,),
                 HelpaWidget.PositiveButton(context, "DONE", () { })
               ],
             ),
           ),

          ],
        ),
      ),
    );
  }
}
