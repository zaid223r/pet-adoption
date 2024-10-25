import 'package:flutter/material.dart';
import 'dart:math';
import '../registration/LoginAndSignup.dart';

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
        color: const Color.fromARGB(255, 194, 233, 106),
        height: double.infinity,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginAndSignup()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image:
                        AssetImage("images/splashscreen/pet$randomNumber.png"),
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    "Pet Adoption",
                    style: TextStyle(
                        fontSize: 36, color: Color.fromARGB(255, 38, 92, 63)),
                  ),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              const Text(
                "Click anywhere to start",
                style: TextStyle(color: Color.fromARGB(109, 33, 73, 35)),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
