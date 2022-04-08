import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Ingredient {
  late final String name;
  final String description;
  final String fact;
  final List keywords;
  final String image;

  Ingredient({
    this.image = '',
    this.name = '',
    this.description = '',
    this.fact = '',
    this.keywords = const [],
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
