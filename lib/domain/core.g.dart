// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Core _$CoreFromJson(Map<String, dynamic> json) => Core(
      core: json['core'] as String?,
      flight: json['flight'] as int?,
      gridfins: json['gridfins'] as bool?,
      legs: json['legs'] as bool?,
      reused: json['reused'] as bool?,
      landingAttempt: json['landingAttempt'] as bool?,
      landingSuccess: json['landingSuccess'] as bool?,
      landingType:
          $enumDecodeNullable(_$LandingTypeEnumMap, json['landingType']),
      landpad: $enumDecodeNullable(_$LandpadEnumMap, json['landpad']),
    );

const _$LandingTypeEnumMap = {
  LandingType.OCEAN: 'OCEAN',
  LandingType.ASDS: 'ASDS',
  LandingType.RTLS: 'RTLS',
};

const _$LandpadEnumMap = {
  Landpad.THE_5_E9_E3032383_ECB761634_E7_CB:
      'THE_5_E9_E3032383_ECB761634_E7_CB',
  Landpad.THE_5_E9_E3032383_ECB6_BB234_E7_CA:
      'THE_5_E9_E3032383_ECB6_BB234_E7_CA',
  Landpad.THE_5_E9_E3032383_ECB267_A34_E7_C7:
      'THE_5_E9_E3032383_ECB267_A34_E7_C7',
  Landpad.THE_5_E9_E3033383_ECBB9_E534_E7_CC:
      'THE_5_E9_E3033383_ECBB9_E534_E7_CC',
  Landpad.THE_5_E9_E3032383_ECB90_A834_E7_C8:
      'THE_5_E9_E3032383_ECB90_A834_E7_C8',
  Landpad.THE_5_E9_E3032383_ECB554034_E7_C9:
      'THE_5_E9_E3032383_ECB554034_E7_C9',
  Landpad.THE_5_E9_E3033383_ECB075134_E7_CD:
      'THE_5_E9_E3033383_ECB075134_E7_CD',
};
