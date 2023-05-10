import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ships.g.dart';

@JsonSerializable(createToJson: false)
class Ships extends Equatable {
  final dynamic lastAisUpdate;
  final String? legacyId;
  final String? model;
  final String? type;
  final List<String>? roles;
  final int? imo;
  final int? mmsi;
  final int? abs;
  final int? shipClass;
  final int? massKg;
  final int? massLbs;
  final int? yearBuilt;
  final String? homePort;
  final String? status;
  final dynamic speedKn;
  final dynamic courseDeg;
  final double? latitude;
  final double? longitude;
  final String? link;
  final String? image;
  final String? name;
  final bool? active;
  final String? id;

  const Ships({
    this.lastAisUpdate,
    this.legacyId,
    this.model,
    this.type,
    this.roles,
    this.imo,
    this.mmsi,
    this.abs,
    this.shipClass,
    this.massKg,
    this.massLbs,
    this.yearBuilt,
    this.homePort,
    this.status,
    this.speedKn,
    this.courseDeg,
    this.latitude,
    this.longitude,
    this.link,
    this.image,
    this.name,
    this.active,
    this.id,
  });

  factory Ships.fromJson(Map<String, dynamic> json) => _$ShipsFromJson(json);

  String getModel(BuildContext context) =>
      model ?? 'spacex.other.unknown';

  bool get hasSeveralRoles => roles?.length != 1 && roles?.length != 0;

  String get primaryRole => roles![0];

  String get secondaryRole => roles![1];

  String? getStatus(BuildContext context) => status?.isNotEmpty == true
      ? status
      : 'spacex.other.unknown';

  int get getBuiltFullDate => yearBuilt!;

  String getSpeed(BuildContext context) => speedKn == null
      ? 'spacex.other.unknown'
      : '${NumberFormat.decimalPattern().format(speedKn * 1.852)} km/h';

  String? getHomePort(BuildContext context) => homePort ?? 'port not found';

  @override
  List<Object?> get props => [
    lastAisUpdate,
    legacyId,
    model,
    imo,
    mmsi,
    abs,
    shipClass,
    massKg,
    massLbs,
    yearBuilt,
    homePort,
    status,
    speedKn,
    courseDeg,
    latitude,
    link,
    image,
    name,
    active,
    id
  ];
}

