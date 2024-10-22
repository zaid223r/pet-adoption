import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart'; //I found this package after I searched https://pub.dev/packages/flutter_otp_text_field
import 'package:pet_adoption/registration/resetPassword/ResetPassword.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  // ignore: non_constant_identifier_names
  Widget Button(String type) {
    Color mainColor;
    Color altColor;

    if (type == "Continue") {
      mainColor = const Color.fromARGB(255, 8, 9, 10);
      altColor = const Color.fromARGB(255, 244, 250, 255);
    } else {
      altColor = const Color.fromARGB(255, 8, 9, 10);
      mainColor = const Color.fromARGB(255, 244, 250, 255);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: TextButton(
        onPressed: () {
          if (type == "Back") {
            Navigator.pop(context);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword()));
          }
        },
      style: TextButton.styleFrom(side: BorderSide(color: mainColor),backgroundColor: altColor ),
        child: Text(
          type,
          style: TextStyle(fontSize: 18, color: mainColor),
        ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = 1 + random.nextInt(3);
    
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: const Color.fromARGB(255, 135, 137, 192),
          height: double.infinity,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                          "images/splashscreen/pet$randomNumber.png"),
                      height: 140,
                      width: 140,
                    ),
                    const Text(
                      "Reset Password",
                      style: TextStyle(
                          fontSize: 30, color: Color.fromARGB(255, 8, 9, 10)),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 7), child:  Text("Enter the 6-digit code sent to your email. \nWe’ve sent a 6-digit verification code to your registered email. Please enter the code below to verify your account.",style: TextStyle(fontWeight: FontWeight.w600),)),
                OtpTextField(numberOfFields: 6, showFieldAsBox: true, borderColor: const Color(0x0008090a),),
                const SizedBox(height: 12,),
                Center(child: Button("Continue")),
                Center(child: Button("Back"),)
              ])),
    ));
  }
}