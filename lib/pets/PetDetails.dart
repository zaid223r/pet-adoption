import 'package:flutter/material.dart';
import 'package:pet_adoption/main.dart';

class Petdetails extends StatefulWidget {
  late final int id;
  // ignore: prefer_const_constructors_in_immutables
  Petdetails({super.key, required this.id});

  @override
  State<Petdetails> createState() => _PetdetailsState();
}

class _PetdetailsState extends State<Petdetails> {
  Widget text(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 175, 122, 109)),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 101, 50, 57)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pet = getPetById(widget.id);

    return Scaffold(
      body: SafeArea(
          child: Container(
        color: const Color.fromARGB(255, 226, 212, 186),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 101, 50, 57),
                    ))
              ],
            ),
            Image(
              image: AssetImage(pet!.imageUrl[0]),
              height: 300,
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, top: 10),
              child: Text(
                "Pet Details : ",
                style: TextStyle(
                    color: Color.fromARGB(255, 101, 50, 57), fontSize: 28),
              ),
            ),
            text('Name: ', pet.name),
            text('Category: ', pet.category),
            text('Breed: ', pet.breed),
            text('Age: ', pet.age),
            text('Health Status: ', pet.healthStatus),
            text('Personality Traits: ', pet.personalityTraits.join(", ")),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              width: double.infinity,
              color: const Color.fromARGB(255, 101, 50, 57),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, top: 10),
              child: Text(
                "Owner Details : ",
                style: TextStyle(
                    color: Color.fromARGB(255, 101, 50, 57), fontSize: 28),
              ),
            ),
            text("Name: ", pet.owner.name),
            text("Email: ", pet.owner.emailAddress)
          ],
        ),
      )),
    );
  }
}
