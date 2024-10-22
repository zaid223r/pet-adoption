import 'package:flutter/material.dart';
import 'splashscreen/SplashScreen.dart';

void main() {

  List<Pet> pets = [
    // Cats
    Pet(
      id: 1,
      name: "Whiskers",
      category: "cat",
      breed: "Siamese",
      age: "2 years",
      healthStatus: "Healthy",
      personalityTraits: ["Curious", "Playful"],
      imageUrl: "images/cats/cat1.png",
    ),
    Pet(
      id: 2,
      name: "Mittens",
      category: "cat",
      breed: "Maine Coon",
      age: "3 years",
      healthStatus: "Vaccinated",
      personalityTraits: ["Friendly", "Affectionate"],
      imageUrl: "images/cats/cat2.png",
    ),
    Pet(
      id: 3,
      name: "Shadow",
      category: "cat",
      breed: "Persian",
      age: "1 year",
      healthStatus: "Healthy",
      personalityTraits: ["Calm", "Independent"],
      imageUrl: "images/cats/cat3.png",
    ),
    // Dogs
    Pet(
      id: 4,
      name: "Buddy",
      category: "dog",
      breed: "Golden Retriever",
      age: "4 years",
      healthStatus: "Vaccinated",
      personalityTraits: ["Friendly", "Energetic"],
      imageUrl: "images/dogs/dog1.png",
    ),
    Pet(
      id: 5,
      name: "Max",
      category: "dog",
      breed: "Bulldog",
      age: "2 years",
      healthStatus: "Healthy",
      personalityTraits: ["Calm", "Loyal"],
      imageUrl: "images/dogs/dog2.png",
    ),
    Pet(
      id: 6,
      name: "Bella",
      category: "dog",
      breed: "Poodle",
      age: "3 years",
      healthStatus: "Vaccinated",
      personalityTraits: ["Intelligent", "Playful"],
      imageUrl: "images/dogs/dog3.png",
    ),
    // Birds
    Pet(
      id: 7,
      name: "Tweety",
      category: "bird",
      breed: "Canary",
      age: "6 months",
      healthStatus: "Healthy",
      personalityTraits: ["Singing", "Active"],
      imageUrl: "images/birds/bird1.png",
    ),
    Pet(
      id: 8,
      name: "Polly",
      category: "bird",
      breed: "Parrot",
      age: "2 years",
      healthStatus: "Healthy",
      personalityTraits: ["Talkative", "Curious"],
      imageUrl: "images/birds/bird2.png",
    ),
    Pet(
      id: 9,
      name: "Chirpy",
      category: "bird",
      breed: "Finch",
      age: "1 year",
      healthStatus: "Vaccinated",
      personalityTraits: ["Lively", "Social"],
      imageUrl: "images/birds/bird3.png",
    ),
  ];

  // ignore: unused_element
  Pet? getPetById(int id) {
    return pets.firstWhere((pet) => pet.id == id);
  }

  runApp(const MaterialApp(home: Splashscreen()));
}


//I asked chatGPT about this and made me a random data for them
class Pet {
  final int id;
  final String name;
  final String category; // e.g., dog, cat, bird
  final String breed;
  final String age;
  final String healthStatus;
  final List<String> personalityTraits;
  final String imageUrl;

  Pet({
    required this.id,
    required this.name,
    required this.category,
    required this.breed,
    required this.age,
    required this.healthStatus,
    required this.personalityTraits,
    required this.imageUrl,
  });
}