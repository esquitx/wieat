import 'package:flutter/material.dart';
import 'package:wieat/services/services.dart';
import 'package:wieat/ingredient/ingredient.dart';

Widget buildIngredientPreview(BuildContext context, Ingredient ingredient) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.2,
    child: Card(
      color: Colors.white,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Flexible(
                    fit: FlexFit.tight,
                    child: Image(
                      image: AssetImage('assets/icons/${ingredient.image}'),
                    ),
                  )),
              Flexible(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Text(ingredient.name.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 1,
                        thickness: 1,
                      ),
                      Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                          fit: FlexFit.tight,
                                          child: previewData(
                                              context, 'ORIGIN ', 'Spain')),
                                    ]),
                                const Flexible(
                                  child: VerticalDivider(
                                    thickness: 3,
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  fit: FlexFit.tight,
                                  child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'DESCRIPTION\n',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        TextSpan(
                                            text: ingredient.description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1),
                                      ])),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      IngredientScreen(ingredient: ingredient)));
        },
      ),
    ),
  );
}

Widget previewData(BuildContext context, String title, String data) {
  return RichText(
      text: TextSpan(
    children: [
      TextSpan(text: "$title \n", style: Theme.of(context).textTheme.headline2),
      TextSpan(text: data, style: Theme.of(context).textTheme.subtitle1),
    ],
  ));
}
