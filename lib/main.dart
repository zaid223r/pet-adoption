import 'package:flutter/material.dart';
import 'splashscreen/SplashScreen.dart';

void main() {
  runApp(const MaterialApp(home: Splashscreen()));
}

//I asked chatGPT about this and made me a random data for them
class Pet {
  final int id;
  final String name;
  final String about;
  final String category; // e.g., dog, cat, bird
  final String breed;
  final String age;
  final String healthStatus;
  final List<String> personalityTraits;
  final String imageUrl;
  final Owner owner;

  Pet(
      {required this.id,
      required this.name,
      required this.about,
      required this.category,
      required this.breed,
      required this.age,
      required this.healthStatus,
      required this.personalityTraits,
      required this.imageUrl,
      required this.owner});
}

class Owner {
  final int id;
  final String name;
  final String phoneNumber;
  final String emailAddress;

  Owner(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.emailAddress});
}

List<Pet> pets = [
  // Cats
  Pet(
    id: 1,
    name: "Whiskers",
    category: "cats",
    breed: "Siamese",
    age: "2 years",
    healthStatus: "Healthy",
    personalityTraits: ["Curious", "Playful"],
    imageUrl: "images/cats/cat1.png",
    owner: owners[0],
    about: "Whiskers is an adventurous Siamese who loves to explore new places. He is always curious about his surroundings and enjoys playing with toys.",
  ),
  Pet(
    id: 2,
    name: "Mittens",
    category: "cats",
    breed: "Maine Coon",
    age: "3 years",
    healthStatus: "Vaccinated",
    personalityTraits: ["Friendly", "Affectionate"],
    imageUrl: "images/cats/cat2.png",
    owner: owners[2],
    about: "Mittens is a friendly and affectionate Maine Coon who enjoys cuddling up with her owners. She is calm but loves to be petted and brushed.",
  ),
  Pet(
    id: 3,
    name: "Shadow",
    category: "cats",
    breed: "Persian",
    age: "1 year",
    healthStatus: "Healthy",
    personalityTraits: ["Calm", "Independent"],
    imageUrl: "images/cats/cat3.png",
    owner: owners[1],
    about: "Shadow is a calm and independent Persian cat who enjoys relaxing in quiet corners. He doesn’t mind being alone but loves gentle attention from time to time.",
  ),
  // Dogs
  Pet(
    id: 4,
    name: "Buddy",
    category: "dogs",
    breed: "Golden Retriever",
    age: "4 years",
    healthStatus: "Vaccinated",
    personalityTraits: ["Friendly", "Energetic"],
    imageUrl: "images/dogs/dog1.png",
    owner: owners[1],
    about: "Buddy is a lively Golden Retriever who is always ready for a game of fetch. He is friendly with everyone he meets and has lots of energy to burn.",
  ),
  Pet(
    id: 5,
    name: "Max",
    category: "dogs",
    breed: "Bulldog",
    age: "2 years",
    healthStatus: "Healthy",
    personalityTraits: ["Calm", "Loyal"],
    imageUrl: "images/dogs/dog2.png",
    owner: owners[3],
    about: "Max is a calm and loyal Bulldog who loves to stay close to his family. Despite his laid-back nature, he is protective and will always watch over his loved ones.",
  ),
  Pet(
    id: 6,
    name: "Bella",
    category: "dogs",
    breed: "Poodle",
    age: "3 years",
    healthStatus: "Vaccinated",
    personalityTraits: ["Intelligent", "Playful"],
    imageUrl: "images/dogs/dog3.png",
    owner: owners[4],
    about: "Bella is a smart and playful Poodle who enjoys learning new tricks. She loves being the center of attention and is always up for some fun.",
  ),
  // Birds
  Pet(
    id: 7,
    name: "Tweety",
    category: "birds",
    breed: "Canary",
    age: "6 months",
    healthStatus: "Healthy",
    personalityTraits: ["Singing", "Active"],
    imageUrl: "images/birds/bird1.png",
    owner: owners[5],
    about: "Tweety is a young and active Canary who loves to sing. Her cheerful songs fill the room with joy, and she is always fluttering around her cage.",
  ),
  Pet(
    id: 8,
    name: "Polly",
    category: "birds",
    breed: "Parrot",
    age: "2 years",
    healthStatus: "Healthy",
    personalityTraits: ["Talkative", "Curious"],
    imageUrl: "images/birds/bird2.png",
    owner: owners[6],
    about: "Polly is a talkative Parrot who loves mimicking sounds and words. Her curious nature often leads her to explore everything in her surroundings.",
  ),
  Pet(
    id: 9,
    name: "Chirpy",
    category: "birds",
    breed: "Finch",
    age: "1 year",
    healthStatus: "Vaccinated",
    personalityTraits: ["Lively", "Social"],
    imageUrl: "images/birds/bird3.png",
    owner: owners[5],
    about: "Chirpy is a lively Finch who enjoys being around other birds. She is very social and will chirp happily whenever someone approaches her cage.",
  ),
];


//random data from chatGPT
List<Owner> owners = [
  Owner(
    id: 1,
    name: "John Doe",
    phoneNumber: "+964 770 1x3 4567",
    emailAddress: "john.doe@example.com",
  ),
  Owner(
    id: 2,
    name: "Jane Smith",
    phoneNumber: "+964 770 2x4 5678",
    emailAddress: "jane.smith@example.com",
  ),
  Owner(
    id: 3,
    name: "Ali Hassan",
    phoneNumber: "+964 770 3x5 6789",
    emailAddress: "ali.hassan@example.com",
  ),
  Owner(
    id: 4,
    name: "Sara Ahmed",
    phoneNumber: "+964 770 4x6 7890",
    emailAddress: "sara.ahmed@example.com",
  ),
  Owner(
    id: 5,
    name: "Michael Brown",
    phoneNumber: "+964 770 5x7 8901",
    emailAddress: "michael.brown@example.com",
  ),
  Owner(
    id: 6,
    name: "Fatima Jassim",
    phoneNumber: "+964 770 6x8 9012",
    emailAddress: "fatima.jassim@example.com",
  ),
  Owner(
    id: 7,
    name: "Omar Khalid",
    phoneNumber: "+964 770 7x9 0123",
    emailAddress: "omar.khalid@example.com",
  ),
];

// ignore: unused_element
Pet? getPetById(int id) {
  return pets.firstWhere((pet) => pet.id == id);
}

// ignore: unused_element
List<Pet> getByCategory(String? category) {
  if (category == null) {
    return pets.toList();
  }

  return pets.where((pet) => pet.category == category).toList();
}
