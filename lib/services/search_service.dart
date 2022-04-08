import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wieat/services/models.dart';
import 'dart:async';

class SearchService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Ingredient>> getIngredients() async {
    // Get collection snapshot
    var snapshot = await _db.collection('ingredients').get();
    // Transform snapshot data into map
    var data = snapshot.docs.map((s) => s.data());
    // Transform from json map to list of Ingredient objects
    var ingredients = data.map((d) => Ingredient.fromJson(d));

    return ingredients.toList();
  }

  Future<List<Ingredient>> getIngredientQuery(String textQuery) async {
    // checkeamos para múltiples entradas
    List<String> listedQuery;
    if (textQuery.contains(',')) {
      listedQuery = textQuery.replaceAll(" ", "").split(",");
    } else {
      listedQuery = [textQuery];
    }
    var ref = _db.collection('ingredients');
    // Get collection snapshot
    var snapshot =
        await ref.where("keywords", arrayContainsAny: listedQuery).get();
    // Transform from json map to list of Ingredient objects
    var data = snapshot.docs.map((snapshot) => snapshot.data());
    // Transform from json map to list of Ingredient objects
    var ingredients = data.map((d) => Ingredient.fromJson(d));
    return ingredients.toList();
  }
}

// Used to pass arguments
class SearchArgument {
  final String searchText;

  SearchArgument(this.searchText);
}
