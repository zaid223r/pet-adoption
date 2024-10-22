import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_adoption/registration/resetPassword/Otp.dart';

class Enteremail extends StatefulWidget {
  const Enteremail({super.key});

  @override
  State<Enteremail> createState() => _EnteremailState();
}

class _EnteremailState extends State<Enteremail> {
  // ignore: non_constant_identifier_names
  Widget InputField(String placeHolder) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: TextFormField(
          decoration: InputDecoration(
              border: const UnderlineInputBorder(), labelText: placeHolder),
        ));
  }

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Otp()));
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
          color: Color.fromARGB(255, 135, 137, 192),
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
                InputField("Enter your account email"),
                Center(child: Button("Continue")),
                Center(child: Button("Back"),)
              ])),
    ));
  }
}
