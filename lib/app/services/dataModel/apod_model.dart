import 'package:json_annotation/json_annotation.dart';

part 'apod_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ApodModel {
  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;
  String? copyright;

  ApodModel(
      {this.date,
      this.copyright,
      this.explanation,
      this.hdurl,
      this.mediaType,
      this.serviceVersion,
      this.title,
      this.url});

  factory ApodModel.fromJson(Map<String, dynamic> json) =>
      _$ApodModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApodModelToJson(this);
}
