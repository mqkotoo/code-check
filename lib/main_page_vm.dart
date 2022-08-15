import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/repository_data.dart';
import 'main_logic.dart';

final _logicProvider = Provider<Logic>((ref) => Logic());
final _repositoryDataProvider = StateProvider<String>((ref) => "");

//遷移先で表示するデータ用のプロバイダー
StateProvider<RepositoryDataItems> _navigationIndexProvider =
    StateProvider<RepositoryDataItems>(
  (ref) => const RepositoryDataItems(
    full_name: "",
    description: "",
    avatar_url: "",
    stargazers_count: 0,
    watchers_count: 0,
    language: "",
    forks_count: 0,
    open_issues_count: 0,
  ),
);

AutoDisposeFutureProviderFamily<RepositoryData, String> _apiFamilyProvider =
    FutureProvider.autoDispose
        .family<RepositoryData, String>((ref, repositoryData) async {
  Logic logic = ref.watch(_logicProvider);

  //リポジトリのデータがない状態の時は、空のものとしてデータを返す
  if (!logic.willProceed(repositoryData)) {
    return RepositoryData.empty;
  }

  return await logic.getRepositoryData(repositoryData);
});

class MainPageVM {
  late final WidgetRef _ref;
  String get repositoryData => _ref.watch(_repositoryDataProvider);

  AsyncValue<RepositoryData> repositoryDataWithFamily(String repositoryData) =>
      _ref.watch(_apiFamilyProvider(repositoryData));

  RepositoryDataItems get tappedRepository =>
      _ref.watch(_navigationIndexProvider);

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  //入力したテキストをプロバイダーに渡す
  void onRepositoryDataChanged(String repositoryData) {
    _ref
        .read(_repositoryDataProvider.notifier)
        .update((state) => repositoryData);
  }

  // onTapで選択されたindexのデータを返す
  void onListTapped(RepositoryDataItems repositoryData) {
    _ref
        .read(_navigationIndexProvider.notifier)
        .update((state) => repositoryData);
  }

}
