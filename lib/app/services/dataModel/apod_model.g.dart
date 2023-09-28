// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApodModel _$ApodModelFromJson(Map<String, dynamic> json) => ApodModel(
      date: json['date'] as String?,
      copyright: json['copyright'] as String?,
      explanation: json['explanation'] as String?,
      hdurl: json['hdurl'] as String?,
      mediaType: json['mediaType'] as String?,
      serviceVersion: json['serviceVersion'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ApodModelToJson(ApodModel instance) => <String, dynamic>{
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'mediaType': instance.mediaType,
      'serviceVersion': instance.serviceVersion,
      'title': instance.title,
      'url': instance.url,
      'copyright': instance.copyright,
    };
