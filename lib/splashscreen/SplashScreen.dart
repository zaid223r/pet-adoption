import 'package:flutter/material.dart';
import 'dart:math';
import '../registration/Login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/splashscreen/pet$randomNumber.png"),
                height: 180,
                width: 180,
              ),
              const Text(
                "Pet Adoption",
                style: TextStyle(
                    fontSize: 36,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 8, 9, 10)),
              )
            ],
          ),
        ),
      )),
    );
  }
}
