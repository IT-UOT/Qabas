// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeScreenState _$$_HomeScreenStateFromJson(Map<String, dynamic> json) =>
    _$_HomeScreenState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_HomeScreenStateToJson(_$_HomeScreenState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_Initial _$$_InitialFromJson(Map<String, dynamic> json) => _$_Initial(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_InitialToJson(_$_Initial instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_Loading _$$_LoadingFromJson(Map<String, dynamic> json) => _$_Loading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoadingToJson(_$_Loading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_Loaded _$$_LoadedFromJson(Map<String, dynamic> json) => _$_Loaded(
      (json['departments'] as List<dynamic>)
          .map((e) => DepartmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoadedToJson(_$_Loaded instance) => <String, dynamic>{
      'departments': instance.departments,
      'runtimeType': instance.$type,
    };

_$_Error _$$_ErrorFromJson(Map<String, dynamic> json) => _$_Error(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_ErrorToJson(_$_Error instance) => <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
