import 'package:example/repositories/history/models/models.dart';

abstract interface class HistoryRepositoryInterface {
  Future<List<HistoryRhymer>> getRhymerList();
  Future<void> setRhymer(HistoryRhymer rhymer);
  Future<void> clear();
}
