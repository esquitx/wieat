// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      fact: json['fact'] as String? ?? '',
      keywords: json['keywords'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'fact': instance.fact,
      'keywords': instance.keywords,
      'image': instance.image,
    };
