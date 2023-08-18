import 'package:cat_app/models/breed.dart';
import 'package:cat_app/navigation/navigation.dart';
import 'package:cat_app/screens/breed_detail/breed_detail_screen.dart';
import 'package:flutter/material.dart';

class BreedDetailRoute extends RouteBuilder {
  static String routeName = "/breed_detail";
  final Breed breed;

  BreedDetailRoute(
    BuildContext context, {
    required this.breed,
  }) : super(context: context);

  @override
  Route getRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return BreedDetailScreen(breed: breed);
      },
      settings: RouteSettings(name: routeName),
    );
  }
}
