import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_adoption/main.dart';

class Petspage extends StatefulWidget {
  const Petspage({super.key});

  @override
  State<Petspage> createState() => _PetspageState();
}

class _PetspageState extends State<Petspage> {
  String? category;
  String activeButton = "All";
  String type = "pets";


  // ignore: non_constant_identifier_names
  Widget PaddingAll(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: widget,
    );
  }

  // ignore: non_constant_identifier_names
  Widget AppBar() {
    Random random = Random();
    int randomNumber = 1 + random.nextInt(3);

    return Container(
        color: const Color.fromARGB(255, 2, 218, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    image:
                        AssetImage("images/splashscreen/pet$randomNumber.png"),
                    height: 60,
                    width: 60),
                const Text(
                  "Pet Adoption",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 9, 10)),
                )
              ],
            ),
            const Icon(
              Icons.settings,
              size: 32,
              color: Color.fromARGB(255, 8, 9, 10),
            )
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Widget PageHeader() {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Container(
            height: 90,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 135, 137, 192),
            ),
          ),
          
          const Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage("images/mainpage.png"),
                height: 200,
                width: 200,
              )),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Button(String name) {
    return Expanded(
        child: TextButton(
            onPressed: () {
              switch (name) {
                case "All":
                  category = null;
                  activeButton = "All";
                  type = "pets";
                  break;
                case "Cats":
                  category = "cat";
                  activeButton = "Cats";
                  type = activeButton;
                  break;
                case "Dogs":
                  category = "dog";
                  activeButton = "Dogs";
                  type = activeButton;
                  break;
                default:
                  category = "bird";
                  activeButton = "Birds";
                  type = activeButton;
                  break;
                
              }
              // print(activeButton);
            },
            style: TextButton.styleFrom(
                backgroundColor: name != activeButton
                    ? const Color.fromARGB(255, 2, 218, 255)
                    : const Color.fromARGB(255, 135, 137, 192),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Text(
              name,
              style: const TextStyle(color: Color.fromARGB(255, 8, 9, 10)),
            )));
  }

  // ignore: non_constant_identifier_names
  Widget PetRecord(Pet pet) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: const Color.fromARGB(255, 244, 250, 255),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 4,
                child: Image(
                  image: AssetImage(pet.imageUrl),
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                )),
            const Expanded(
                flex: 1,
                child: SizedBox(
                  width: 5,
                )),
            Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name: ${pet.name}"),
                    Text("Age: ${pet.age}"),
                    Text("Health Status: ${pet.healthStatus}")
                  ],
                )),
            Expanded(
                flex: 4,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "More details",
                    style: TextStyle(fontSize: 10),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pets = getByCategory(category);
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: const Color.fromARGB(255, 2, 218, 255),
                child: Column(children: [
                  AppBar(),
                  PageHeader(),
                  Row(
            children: [
              Button("All"),
              Button("Cats"),
              Button("Dogs"),
              Button("Birds")
            ],
          ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "All ${type.toLowerCase()} available",
                          style: const TextStyle(fontSize: 32),
                        ),
                        for (var pet in pets) PaddingAll(PetRecord(pet)),
                      ],
                    ),
                  )),
                ]))));
  }
}
