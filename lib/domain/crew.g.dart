// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      name: json['name'] as String?,
      agency: json['agency'] as String?,
      image: json['image'] as String?,
      wikipedia: json['wikipedia'] as String?,
      launches: (json['launches'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      id: json['id'] as String?,
    );
