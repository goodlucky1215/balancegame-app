// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogGetDto _$CatalogGetDtoFromJson(Map<String, dynamic> json) =>
    CatalogGetDto(
      success: json['success'] as int,
      data: CatalogListData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      userCode: json['userCode'] as String,
    );

Map<String, dynamic> _$CatalogGetDtoToJson(CatalogGetDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'userCode': instance.userCode,
    };

CatalogListData _$CatalogListDataFromJson(Map<String, dynamic> json) =>
    CatalogListData(
      catalogId: json['catalogId'] as int,
      catalogName: json['catalogName'] as String,
      questionDtos: json['questionDtos'] as String,
    );

Map<String, dynamic> _$CatalogListDataToJson(CatalogListData instance) =>
    <String, dynamic>{
      'catalogId': instance.catalogId,
      'catalogName': instance.catalogName,
      'questionDtos': instance.questionDtos,
    };
