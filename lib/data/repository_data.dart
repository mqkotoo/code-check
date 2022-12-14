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

  static const empty = RepositoryData(total_count: 0, items: []);

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
    required RepositoryDataOwner owner,
  }) = _RepositoryDataItems;

  factory RepositoryDataItems.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDataItemsFromJson(json);
}

@freezed
class RepositoryDataOwner with _$RepositoryDataOwner {
  const factory RepositoryDataOwner({
    required String avatar_url,
  }) = _RepositoryDataOwner;

  factory RepositoryDataOwner.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDataOwnerFromJson(json);
}