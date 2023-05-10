import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable(createToJson: false)
class Crew extends Equatable {
  final String? name;
  final String? agency;
  final String? image;
  final String? wikipedia;
  final List<String>? launches;
  final String? status;
  final String? id;

  const Crew({
    this.name,
    this.agency,
    this.image,
    this.wikipedia,
    this.launches,
    this.status,
    this.id,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  @override
  List<Object?> get props => [name, agency, image, wikipedia, launches, status, id];

}
