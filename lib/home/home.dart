import 'package:flutter/material.dart';
import 'package:wieat/search/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Flexible(flex: 1, child: Container()),
        Flexible(
          flex: 2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const FlutterLogo(
                  size: 100,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                        label: const Text("Scan"),
                        icon: const Icon(Icons.camera),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/camera'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange[200],
                        )),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      label: const Text("Search"),
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SearchScreen(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[200],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        Flexible(flex: 1, child: Container()),
      ]),
    );
  }
}
