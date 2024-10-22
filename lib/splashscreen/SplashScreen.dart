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
        color: const Color.fromARGB(255, 226, 212, 186),
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
                    color: Color.fromARGB(255, 101, 50, 57)),
              ),
              const SizedBox(height: 200,),
              const Text("Click anywhere to start", style: TextStyle(color: Color.fromARGB(110, 101, 50, 57)),),
            ],
          ),
        ),
      )),
    );
  }
}
