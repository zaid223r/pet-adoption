import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  int stage = 0;

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
  Widget Button(String type) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Container(
            width: double.infinity,
            color: type == "Back"
                ? Colors.white
                : const Color.fromARGB(255, 194, 233, 106),
            child: TextButton(
              onPressed: () {
                stage != 2
                    ? type == "Continue"
                        ? setState(() {
                            stage = 1;
                          })
                        : type == "Back"
                            ? Navigator.pop(context)
                            : setState(() {
                                stage = 2;
                              })
                    : Navigator.pop(context);
              },
              child: Text(
                type,
                style: TextStyle(
                    fontSize: 18,
                    color: type == "Continue"
                        ? const Color.fromARGB(255, 38, 92, 63)
                        : const Color.fromARGB(255, 8, 9, 10)),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = 1 + random.nextInt(3);

    return Scaffold(
        body: SafeArea(
      child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          height: double.infinity,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
            Text(
              stage == 0
                  ? "Forget Password"
                  : stage == 1
                      ? "Enter Verification Code"
                      : "Reset Your Password",
              style: const TextStyle(
                  color: Color.fromARGB(255, 8, 9, 10),
                  fontWeight: FontWeight.w600,
                  fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              stage == 0
                  ? "Enter your email account to reset password"
                  : stage == 1
                      ? "We have sent a code to your email"
                      : "The password must be diffrent than before",
              style: const TextStyle(
                  color: Color.fromARGB(155, 8, 9, 10), fontSize: 13),
            ),
            stage == 0
                ? Column(
                    children: [
                      const Image(
                        image: AssetImage("images/enteremail.png"),
                        width: double.infinity,
                      ),
                      InputField(
                          const Icon(Icons.mail), "Enter your account email"),
                      const SizedBox(
                        height: 30,
                      ),
                      Button("Continue"),
                      Button("Back")
                    ],
                  )
                : stage == 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 250,
                          ),
                          OtpTextField(
                            numberOfFields: 6,
                            showFieldAsBox: true,
                            borderColor: const Color.fromARGB(255, 8, 9, 10),
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                          Button("Verify Now")
                        ],
                      )
                    : Column(
                        children: [
                          InputField(const Icon(Icons.lock), "New password"),
                          InputField(
                              const Icon(Icons.lock), "Confirm password"),
                          const SizedBox(
                            height: 360,
                          ),
                          Button("Continue"),
                          Button("Back")
                        ],
                      )
          ])),
    ));
  }
}
