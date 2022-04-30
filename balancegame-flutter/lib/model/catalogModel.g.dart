// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogGetDto _$CatalogGetDtoFromJson(Map<String, dynamic> json) =>
    CatalogGetDto(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => CatalogListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
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
    );

Map<String, dynamic> _$CatalogListDataToJson(CatalogListData instance) =>
    <String, dynamic>{
      'catalogId': instance.catalogId,
      'catalogName': instance.catalogName,
    };
