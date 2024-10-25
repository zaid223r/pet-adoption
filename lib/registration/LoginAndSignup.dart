import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_adoption/pets/PetsPage.dart';
import 'package:pet_adoption/registration/ResetPassword.dart';

class LoginAndSignup extends StatefulWidget {
  const LoginAndSignup({super.key});

  @override
  State<LoginAndSignup> createState() => _LoginAndSignupState();
}

class _LoginAndSignupState extends State<LoginAndSignup> {
  bool haveAccount = true;

  // ignore: non_constant_identifier_names
  Widget PageHeader() {
    Random random = Random();
    int randomNumber = 1 + random.nextInt(3);
    Color loginColor;
    Color signUpColor;

    if (haveAccount) {
      loginColor = const Color.fromARGB(255, 38, 92, 63);
      signUpColor = const Color.fromARGB(64, 0, 0, 0);
    } else {
      loginColor = const Color.fromARGB(64, 0, 0, 0);
      signUpColor = const Color.fromARGB(255, 38, 92, 63);
    }

    return Container(
      color: Colors.white,
      height: 250,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/splashscreen/pet$randomNumber.png"),
                height: 38,
                width: 38,
              ),
              const Text(
                "Pet Adoption",
                style: TextStyle(
                    fontSize: 26, color: Color.fromARGB(255, 38, 92, 63)),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Welcome to Pet Adoption",
            style: TextStyle(
                color: Color.fromARGB(255, 8, 9, 10),
                fontWeight: FontWeight.w600,
                fontSize: 28),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Sign up or login below to adopt or to put your pet up to adoption",
            style:
                TextStyle(color: Color.fromARGB(155, 8, 9, 10), fontSize: 13),
          ),
          const SizedBox(
            height: 37,
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          haveAccount = true;
                        });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: loginColor),
                      ))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          haveAccount = false;
                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: signUpColor),
                      )))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: (Container(
                height: 3,
                color: loginColor,
              ))),
              Expanded(
                  child: Container(
                height: 3,
                color: signUpColor,
              ))
            ],
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget InputField(Icon icon, String placeHolder) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Container(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      //I found this widget after searching https://docs.flutter.dev/cookbook/forms/text-input
                      decoration:
                          InputDecoration(labelText: placeHolder, icon: icon),
                    )))));
  }

  // ignore: non_constant_identifier_names
  Widget LoginWith(String withWho) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/$withWho.png"),
                width: 35,
                height: 35,
              ),
              Text(
                "Login with $withWho",
                style: const TextStyle(
                    color: Color.fromARGB(255, 8, 9, 10), fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ContinueButton() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 194, 233, 106),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Petspage()));
              },
              child: Text(
                haveAccount ? "Login" : "SignUp",
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 38, 92, 63)),
              ),
            ),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget IconWithText(Icon icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [icon, Text(text)],
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Resetpassword()));
            },
            child: Text(otherpage,
                style: const TextStyle(color: Color.fromARGB(255, 38, 92, 63))),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: const Color.fromARGB(255, 214, 224, 235),
                height: double.infinity,
                width: double.infinity,
                child: Column(children: [
                  PageHeader(),
                  const SizedBox(
                    height: 30,
                  ),
                  haveAccount
                      ? Column(
                          children: [
                            LoginWith("Apple"),
                            LoginWith("Google"),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text("or login with email"),
                            ),
                            InputField(
                                const Icon(Icons.mail), "Enter your email."),
                            InputField(
                                const Icon(Icons.lock), "Enter your password."),
                            OtherButtons("Lost password?", "reset it here"),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            InputField(const Icon(Icons.person), "Your name."),
                            InputField(
                                const Icon(Icons.mail), "Enter your email."),
                            InputField(
                                const Icon(Icons.lock), "Enter your password"),
                            InputField(const Icon(Icons.lock),
                                "Confirm your password"),
                            const SizedBox(
                              height: 15,
                            ),
                            IconWithText(const Icon(Icons.done),
                                "At least 8 characthers"),
                            IconWithText(
                                const Icon(Icons.done), "At least 1 number"),
                            IconWithText(const Icon(Icons.done),
                                "Both upper and lower case letters"),
                            const SizedBox(
                              height: 110,
                            )
                          ],
                        ),
                  ContinueButton(),
                ]))));
  }
}
