import 'package:flutter/material.dart';

// SERVICES
import 'package:wieat/services/services.dart';

class IngredientScreen extends StatefulWidget {
  final Ingredient ingredient;

  IngredientScreen({Key? key, required this.ingredient}) : super(key: key);

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("HELLO THERE")));
  }
}
