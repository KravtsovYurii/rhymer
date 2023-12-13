import 'package:example/repositories/history/history.dart';
import 'package:realm/realm.dart';

class HistoryRepository implements HistoryRepositoryInterface {
  HistoryRepository({required this.realm});

  final Realm realm;

  @override
  Future<List<HistoryRhymer>> getRhymerList() async {
    return realm.all<HistoryRhymer>().toList();
  }

  @override
  Future<void> setRhymer(HistoryRhymer rhymer) async {
    realm.write(() => realm.add(rhymer));
  }

  @override
  Future<void> clear() async {
    realm.write(() => realm.deleteAll<HistoryRhymer>());
  }
}
