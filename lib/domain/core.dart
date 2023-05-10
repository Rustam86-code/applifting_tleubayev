import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'domain.dart';

part 'core.g.dart';

@JsonSerializable(createToJson: false)
class Core extends Equatable {
  const Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });
  @JsonKey(name: 'core')
  final String? core;
  @JsonKey(name: 'flight')
  final int? flight;
  @JsonKey(name: 'gridfins')
  final bool? gridfins;
  @JsonKey(name: 'legs')
  final bool? legs;
  @JsonKey(name: 'reused')
  final bool? reused;
  @JsonKey(name: 'landingAttempt')
  final bool? landingAttempt;
  @JsonKey(name: 'landingSuccess')
  final bool? landingSuccess;
  @JsonKey(name: 'landingType')
  final LandingType? landingType;
  @JsonKey(name: 'landpad')
  final Landpad? landpad;

  factory Core.fromJson(Map<String, dynamic> json) => _$CoreFromJson(json);

  @override
  List<Object?> get props => [
    core,
    flight,
    gridfins,
    legs,
    reused,
    landingAttempt,
    landingSuccess,
    landingType,
    landpad
  ];
}
