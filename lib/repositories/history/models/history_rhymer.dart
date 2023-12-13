import 'package:realm/realm.dart';

part 'history_rhymer.g.dart';

@RealmModel()
class _HistoryRhymer {
  @PrimaryKey()
  late String id;
  late String word;
  late List<String> name;
}
