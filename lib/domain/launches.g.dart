// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launches _$LaunchesFromJson(Map<String, dynamic> json) => Launches(
      name: json['name'] as String?,
      details: json['details'] as String?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      dateUtc: json['date_utc'] == null
          ? null
          : DateTime.parse(json['date_utc'] as String),
      core: json['core'] == null
          ? null
          : Core.fromJson(json['core'] as Map<String, dynamic>),
      dateLocal: json['date_local'] == null
          ? null
          : DateTime.parse(json['date_local'] as String),
    );

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      video: json['video_link'] as String?,
      wikipedia: json['wikipedia'] as String?,
      patch: json['patch'] == null
          ? null
          : Patch.fromJson(json['patch'] as Map<String, dynamic>),
    );
