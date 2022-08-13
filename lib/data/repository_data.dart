import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'repository_data.freezed.dart';
part 'repository_data.g.dart';

@freezed
class RepositoryData with _$RepositoryData {
  const factory RepositoryData({
    required int total_count,
    required List<RepositoryDataItems> items,
  }) = _RepositoryData;

  factory RepositoryData.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDataFromJson(json);
}

@freezed
class RepositoryDataItems with _$RepositoryDataItems {
  const factory RepositoryDataItems({
    required String full_name,
    required String? description,
    required String? avatar_url,
    required String? language,
    required int stargazers_count,
    required int watchers_count,
    required int forks_count,
    required int open_issues_count,
  }) = _RepositoryDataItems;

  factory RepositoryDataItems.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDataItemsFromJson(json);
}