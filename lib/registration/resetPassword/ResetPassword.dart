import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_adoption/registration/Login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  // ignore: non_constant_identifier_names
  Widget InputField(String placeHolder) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: TextFormField(
          //I found this widget after searching https://docs.flutter.dev/cookbook/forms/text-input
          decoration: InputDecoration(
              border: const UnderlineInputBorder(), labelText: placeHolder),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget Button(String type) {
    Color mainColor;
    Color altColor;

    if (type == "Continue") {
      mainColor = const Color.fromARGB(255, 101, 50, 57);
      altColor = const Color.fromARGB(255, 204, 199, 185);
    } else {
      altColor = const Color.fromARGB(255, 101, 50, 57);
      mainColor = const Color.fromARGB(255, 204, 199, 185);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: TextButton(
        onPressed: () {
          if (type == "Back") {
            Navigator.pop(context);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Login()));
          }
        },
        style: TextButton.styleFrom(
            side: BorderSide(color: mainColor), backgroundColor: altColor),
        child: Text(
          type,
          style: TextStyle(fontSize: 18, color: mainColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = 1 + random.nextInt(3);

    return Scaffold(
        body: SafeArea(
            child: Container(
                color: const Color.fromARGB(255, 226, 212, 186),
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
                                fontSize: 36,
                                color: Color.fromARGB(255, 101, 50, 57)),
                          )
                        ],
                      ),
                      InputField("New password"),
                      InputField("Confirm password"),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Button("Continue"), Button("Back")],
                        ),
                      )
                    ]))));
  }
}
