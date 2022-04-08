// SAVING IMAGE
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> getFilePath() async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  String appDocumentsPath = appDocumentsDirectory.path;
  String filePath = '$appDocumentsPath/ingredientListImage.png';

  return filePath;
}
