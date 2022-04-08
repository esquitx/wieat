import 'package:flutter/material.dart';

// SERVICES
import 'package:wieat/services/services.dart';

// SHARED (bottom nav bar)
import 'package:wieat/shared/shared.dart';

// Ingredient preview
import 'package:wieat/ingredient/ingredient_preview.dart';

//
class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  late Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUserPastIngredients();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() async {
    var showResults = [];

    if (_searchController.text != "") {
      // Obtain results in query

      List<Ingredient> ingredientList = await SearchService()
          .getIngredientQuery(_searchController.text.toLowerCase());

      showResults = ingredientList;
    } else {
      showResults = _allResults;
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  // For now we retrieve ALL ingredients
  getUserPastIngredients() async {
    // Ingredient List
    var ingredientList = await SearchService().getIngredients();
    // set view to the infredients in ingredientList
    setState(() {
      _allResults = ingredientList;
    });
    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.orange[300],
      child: Scaffold(
        body: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _searchController,
                    decoration:
                        const InputDecoration(suffixIcon: Icon(Icons.search)),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _resultsList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildIngredientPreview(context, _resultsList[index]),
                  ),
                )
              ],
            )),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
