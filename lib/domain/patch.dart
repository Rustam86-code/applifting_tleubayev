import 'package:json_annotation/json_annotation.dart';

part 'patch.g.dart';

@JsonSerializable(createToJson: false)
class Patch {
  Patch({
    this.small,
    this.large,
  });

  @JsonKey(name: 'small')
  final String? small;
  @JsonKey(name: 'large')
  final String? large;

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);
}
