import 'package:json_annotation/json_annotation.dart';

import 'domain.dart';

part 'launches.g.dart';


@JsonSerializable(createToJson: false)
class Launches {
  Launches({this.name, this.details, this.links, this.dateUtc, this.core, this.dateLocal});

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'details', includeIfNull: true, nullable: true)
  final String? details;
  @JsonKey(name: 'links')
  final Links? links;
  @JsonKey(name: 'date_utc')
  final DateTime? dateUtc;
  @JsonKey(name: 'core')
  final Core? core;
  @JsonKey(name: 'date_local')
  final DateTime? dateLocal;

  factory Launches.fromJson(Map<String, dynamic> json) =>
      _$LaunchesFromJson(json);
}

@JsonSerializable(createToJson: false)
class Links {
  Links({this.video, this.wikipedia, this.patch});


  @JsonKey(name: 'video_link')
  final String? video;
  final String? wikipedia;
  final Patch? patch;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

