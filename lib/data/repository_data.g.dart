// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositoryData _$$_RepositoryDataFromJson(Map<String, dynamic> json) =>
    _$_RepositoryData(
      total_count: json['total_count'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositoryDataItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RepositoryDataToJson(_$_RepositoryData instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'items': instance.items,
    };

_$_RepositoryDataItems _$$_RepositoryDataItemsFromJson(
        Map<String, dynamic> json) =>
    _$_RepositoryDataItems(
      full_name: json['full_name'] as String,
      description: json['description'] as String?,
      avatar_url: json['avatar_url'] as String?,
      language: json['language'] as String?,
      stargazers_count: json['stargazers_count'] as int,
      watchers_count: json['watchers_count'] as int,
      forks_count: json['forks_count'] as int,
      open_issues_count: json['open_issues_count'] as int,
      owner:
          RepositoryDataOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RepositoryDataItemsToJson(
        _$_RepositoryDataItems instance) =>
    <String, dynamic>{
      'full_name': instance.full_name,
      'description': instance.description,
      'avatar_url': instance.avatar_url,
      'language': instance.language,
      'stargazers_count': instance.stargazers_count,
      'watchers_count': instance.watchers_count,
      'forks_count': instance.forks_count,
      'open_issues_count': instance.open_issues_count,
      'owner': instance.owner,
    };

_$_RepositoryDataOwner _$$_RepositoryDataOwnerFromJson(
        Map<String, dynamic> json) =>
    _$_RepositoryDataOwner(
      avatar_url: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$_RepositoryDataOwnerToJson(
        _$_RepositoryDataOwner instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatar_url,
    };
