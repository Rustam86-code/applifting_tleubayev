// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ships _$ShipsFromJson(Map<String, dynamic> json) => Ships(
      lastAisUpdate: json['lastAisUpdate'],
      legacyId: json['legacyId'] as String?,
      model: json['model'] as String?,
      type: json['type'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      imo: json['imo'] as int?,
      mmsi: json['mmsi'] as int?,
      abs: json['abs'] as int?,
      shipClass: json['shipClass'] as int?,
      massKg: json['massKg'] as int?,
      massLbs: json['massLbs'] as int?,
      yearBuilt: json['yearBuilt'] as int?,
      homePort: json['homePort'] as String?,
      status: json['status'] as String?,
      speedKn: json['speedKn'],
      courseDeg: json['courseDeg'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      link: json['link'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      id: json['id'] as String?,
    );
