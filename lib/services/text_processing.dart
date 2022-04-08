List<String> ingredientWords = [
  'Ingredientes:',
  'Ingredientes'
      'Ingredients:'
];

String getProcessedText(rawText) {
  String processedText;
  // We remove any possible percentage of ingredients
  String withoutComposition = rawText.replaceAll(RegExp('\\(.*?\\)'), '');
  String withoutJumps =
      withoutComposition.replaceAll('\r', ' ').replaceAll('\n', '');
  // We separate ingredients based on ','
  for (var i = 0; i < ingredientWords.length; i++) {
    if (withoutJumps.contains(ingredientWords[i])) {
      withoutJumps.replaceAll(ingredientWords[i], '');
    }
  }

  processedText = withoutJumps;

  return processedText;
}
