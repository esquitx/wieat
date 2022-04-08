// manage request
import 'package:http/http.dart';

// encode image
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:convert';

class OcrApi {
  static Future<ParsedText> getImageIngredients(
    String imagePath,
    String languageCode,
  ) async {
    // read image as base64
    ByteData bytes = await rootBundle.load(imagePath);
    var buffer = bytes.buffer;
    String img64 = base64Encode(Uint8List.view(buffer));
    String fileType = imagePath.split(".").last;
    String img64formatted = 'data:image/$fileType;base64,' + img64;
    var headers = {'apikey': 'APIKEY'};
    var request = MultipartRequest(
        'POST', Uri.parse('https://api.ocr.space/parse/image'));
    request.fields.addAll({
      'base64image': img64formatted,
      'language': 'spa',
      'scale': 'true',
      'filetype': fileType
    });

    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    var stringResponse = await response.stream.bytesToString();

    final responseJson = jsonDecode(stringResponse);

    ParsedText text = ParsedText.decode(responseJson);

    return text;
  }
}

class ParsedText {
  final String text;
  final bool error;

  const ParsedText({
    required this.text,
    required this.error,
  });

  factory ParsedText.decode(Map<String, dynamic> json) {
    if (json['IsErroredOnProcessing']) {
      return ParsedText(text: '', error: json['IsErroredOnProcessing']);
    } else {
      return ParsedText(
          text: json['ParsedResults'][0]['ParsedText'],
          error: json['IsErroredOnProcessing']);
    }
  }
}
