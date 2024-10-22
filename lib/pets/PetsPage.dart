import 'package:flutter/material.dart';
import 'package:pet_adoption/main.dart';
import 'package:pet_adoption/pets/PetDetails.dart';

class Petspage extends StatefulWidget {
  late final String? category;
  late final String activeButton;
  late final String type;

  // I learned this here https://youtu.be/l3KnuUmlr-w
  // ignore: prefer_const_constructors_in_immutables
  Petspage({
    super.key,
    required this.category,
    required this.activeButton,
    required this.type,
  });

  @override
  State<Petspage> createState() => _PetspageState();
}

class _PetspageState extends State<Petspage> {
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
        color: const Color.fromARGB(255, 226, 212, 186),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
            Icon(
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
              color: Color.fromARGB(255, 175, 122, 109),
            ),
          ),
          const Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage("images/mainpage.png"),
                height: 180,
                width: 180,
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
              if (name == "All") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Petspage(
                            category: null,
                            activeButton: "All",
                            type: "pets")));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Petspage(
                            category: name.toLowerCase(),
                            activeButton: name,
                            type: name.toLowerCase())));
              }
            },
            style: TextButton.styleFrom(
                backgroundColor: name != widget.activeButton
                    ? const Color.fromARGB(255, 226, 212, 186)
                    : const Color.fromARGB(255, 175, 122, 109),
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Petdetails(id: pet.id)));
                  },
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
    var pets = getByCategory(widget.category);
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: const Color.fromARGB(255, 226, 212, 186),
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
                          "All ${widget.type.toLowerCase()} available",
                          style: const TextStyle(fontSize: 32),
                        ),
                        for (var pet in pets) PaddingAll(PetRecord(pet)),
                      ],
                    ),
                  )),
                ]))));
  }
}
