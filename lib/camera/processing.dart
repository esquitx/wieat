import 'package:flutter/material.dart';
import 'package:wieat/camera/camera.dart';

// API
import 'package:wieat/services/services.dart';

class ProcessingScreen extends StatelessWidget {
  const ProcessingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ApiArguments;
    return FutureBuilder<ParsedText>(
        future: OcrApi.getImageIngredients(args.imagePath, args.languageCode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return (const Center(
              child: Text("There was an error"),
            ));
          } else if (snapshot.hasData) {
            var parsedText = snapshot.data;

            String processedText = getProcessedText(parsedText);
            Navigator.pushNamed(context, '/processing',
                arguments: SearchArgument(processedText));

            return const CircularProgressIndicator();
          } else {
            return const Text("Nothing found :(");
          }
        });
  }
}
