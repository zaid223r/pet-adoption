import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_adoption/pets/PetsPage.dart';

class Addpet extends StatefulWidget {
  const Addpet({super.key});

  @override
  State<Addpet> createState() => _AddpetState();
}

class _AddpetState extends State<Addpet> {

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
              child: const Text(
                "Add Pet",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 38, 92, 63)),
              ),
            ),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget InputField(String placeHolder) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextFormField(
          //I found this widget after searching https://docs.flutter.dev/cookbook/forms/text-input
          decoration: InputDecoration(labelText: placeHolder),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = 1 + random.nextInt(3);
    return Scaffold(
        body: SafeArea(
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
          "Add Pet",
          style: TextStyle(
              color: Color.fromARGB(255, 8, 9, 10),
              fontWeight: FontWeight.w600,
              fontSize: 28),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Add your pet to be adoption",
          style: TextStyle(color: Color.fromARGB(155, 8, 9, 10), fontSize: 13),
        ),
        const SizedBox(
          height: 10,
        ),
        InputField("Pet name"),
        InputField("About"),
        InputField("Category"),
        InputField("Breed"),
        InputField("Age"),
        InputField("Health Status"),
        InputField("Personality Traits"),
        const SizedBox(
          height: 15,
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: Colors.white, fixedSize: const Size(200, 30)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.upload,
                color: Color.fromARGB(255, 8, 9, 10),
              ),
              Text(
                "Add pet images",
                style: TextStyle(color: Color.fromARGB(255, 8, 9, 10)),
              )
            ],
          ),
        ),
        const SizedBox(height: 120,),
        ContinueButton(),
      ],
    )));
  }
}
