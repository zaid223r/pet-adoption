import 'package:flutter/material.dart';
import 'package:pet_adoption/main.dart';
import 'package:pet_adoption/pets/AddPet.dart';
import 'package:pet_adoption/pets/PetDetails.dart';

class Petspage extends StatefulWidget {
  // I learned this here https://youtu.be/l3KnuUmlr-w
  // ignore: prefer_const_constructors_in_immutables
  Petspage({
    super.key,
  });

  @override
  State<Petspage> createState() => _PetspageState();
}

class _PetspageState extends State<Petspage> {
  String? category;
  String activeButton = "All";
  String type = "All";

  // ignore: non_constant_identifier_names
  Widget PaddingAll(Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: widget,
    );
  }

  // ignore: non_constant_identifier_names
  Widget AppBar() {
    return Container(
        height: 60,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Hello, hello",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 8, 9, 10)),
                  ),
                )
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Addpet()));
                  },
                  child: const Icon(
                    Icons.add,
                    size: 32,
                    color: Color.fromARGB(255, 8, 9, 10),
                  ),
                ),
                const Icon(
                  Icons.settings,
                  size: 32,
                  color: Color.fromARGB(255, 8, 9, 10),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Widget PageHeader() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
      child: Container(
          height: 160,
          width: double.infinity,
          color: const Color.fromARGB(255, 194, 233, 106),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${getNumByCatagory(category)} currently",
                style: const TextStyle(
                    color: Color.fromARGB(255, 8, 9, 10), fontSize: 28),
              ),
              const Text(
                "available for adoption",
                style: TextStyle(
                    color: Color.fromARGB(255, 8, 9, 10), fontSize: 28),
              )
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Button(String name) {
    return Expanded(
        child: TextButton(
            onPressed: () {
              if (name == "All") {
                setState(() {
                  category = null;
                  activeButton = "All";
                  type = "pets";
                });
              } else {
                setState(() {
                  category = name.toLowerCase();
                  activeButton = name;
                  type = name.toLowerCase();
                });
              }
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("images/${name.toLowerCase()}.png"),
              backgroundColor: name == activeButton
                  ? const Color.fromARGB(255, 194, 233, 106)
                  : const Color.fromARGB(255, 255, 255, 255),
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
                  image: AssetImage(pet.imageUrl[0]),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Petdetails(id: pet.id)));
                  },
                  child: const Text(
                    "More details",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 194, 233, 106)),
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
                color: const Color.fromARGB(255, 255, 255, 255),
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
                        for (var pet in pets) PaddingAll(PetRecord(pet)),
                      ],
                    ),
                  )),
                ]))));
  }
}
