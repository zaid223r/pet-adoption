import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_adoption/pets/PetsPage.dart';
import 'package:pet_adoption/registration/Registration.dart';
import 'package:pet_adoption/registration/resetPassword/EnterEmail.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  Widget ContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Petspage(category: null, activeButton: "All", type: "pets",)));
        },
        style: TextButton.styleFrom(
            side: const BorderSide(color: Color.fromARGB(255, 101, 50, 57)),
            backgroundColor: const Color.fromARGB(255, 204, 199, 185)),
        child: const Text(
          "Continue",
          style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 101, 50, 57)),
        ),
      ),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Enteremail()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registration()));
              }
            },
            child: Text(otherpage,
                style:
                    const TextStyle(color: Color.fromARGB(255, 101, 50, 57))),
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
                            "Login",
                            style: TextStyle(
                                fontSize: 36,
                                color: Color.fromARGB(255, 101, 50, 57)),
                          )
                        ],
                      ),
                      InputField("Enter your email"),
                      InputField("Enter your password"),
                      OtherButtons("Lost password?", "reset it here"),
                      ContinueButton(),
                      OtherButtons("Don't have an account?", "Sign up here"),
                    ]))));
  }
}
