import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_adoption/registration/Login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

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
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const ));
          }
        },
      style: TextButton.styleFrom(side: BorderSide(color: mainColor),backgroundColor: altColor ),
        child: Text(
          type,
          style: TextStyle(fontSize: 18, color: mainColor),
        ),),
    );
  }

  // ignore: non_constant_identifier_names
  Widget OtherButtons(String label, String otherpage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(label),
          TextButton(
            onPressed: () {
              if (otherpage == "reset it here") {
                        // builder: (context) => const Enteremail()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Login()));
              }
            },
            child: Text(otherpage,
                style:
                    const TextStyle(color: Color.fromARGB(255, 244, 250, 255))),
          )
        ],
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
                            "Registration",
                            style: TextStyle(
                                fontSize: 36,
                                color: Color.fromARGB(255, 8, 9, 10)),
                          )
                        ],
                      ),
                      InputField("Enter your email"),
                      InputField("Enter password"),
                      InputField("Confirm password"),
                      Button("Continue"),
                      OtherButtons("Have an account?", "login here")
                    ]))));
  }
}