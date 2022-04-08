import 'package:flutter/material.dart';

// MENU PLUGIN
import 'package:selection_menu/selection_menu.dart';

List<Language> languageSelector = [
  Language('icons/flags/png/gb.png', 'eng', 'English'),
  Language('icons/flags/png/es.png', 'spa', 'Español'),
  Language('icons/flags/png/fr.png', 'fre', 'Français'),
];

class Language {
  String path;
  String code;
  String name;

  Language(this.path, this.code, this.name);
}

String selectedLanguage = languageSelector[0].code;

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionMenu(
      itemsList: languageSelector,
      itemBuilder: itemBuilder,
      onItemSelected: onItemSelected,
      initiallySelectedItemIndex: 0,
      showSelectedItemAsTrigger: true,
      closeMenuWhenTappedOutside: true,
      closeMenuOnItemSelected: true,
    );
  }

  Widget itemBuilder(
      BuildContext context, Language language, OnItemTapped onItemTapped) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onItemTapped,
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(language.path, package: 'country_icons', scale: 4),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }

  void onItemSelected(Language language) {
    selectedLanguage = language.code;
  }
}
