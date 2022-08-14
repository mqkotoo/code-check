import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/repository_data.dart';
import 'main_logic.dart';


final _logicProvider = Provider<Logic>((ref) => Logic());
final _repositoryDataProvider = StateProvider<String>((ref) => "");

AutoDisposeFutureProviderFamily<RepositoryData, String> _apiFamilyProvider =
FutureProvider.autoDispose.family<RepositoryData,String>((ref,repositoryData) async {

  Logic logic  = ref.watch(_logicProvider);

  if(!logic.willProceed(repositoryData)) {
    return RepositoryData.empty;
  }

  return await logic.getRepositoryData(repositoryData);
});

class MainPageVM {

  late final WidgetRef _ref;
  String get repositoryData => _ref.watch(_repositoryDataProvider);

  AsyncValue<RepositoryData> repositoryDataWithFamily(String repositoryData) =>
      _ref.watch(_apiFamilyProvider(repositoryData));

  void setRef(WidgetRef ref) {
    _ref = ref;
  }

  void onRepositoryDataChanged(String repositoryData) {
    _ref.read(_repositoryDataProvider.notifier).update((state) => repositoryData);
  }
}