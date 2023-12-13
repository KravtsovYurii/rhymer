import 'package:example/repositories/history/models/models.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'rhymes.g.dart';

@JsonSerializable()
class Rhymes {
  const Rhymes({required this.episode});

  factory Rhymes.fromJson(Map<String, dynamic> json) => _$RhymesFromJson(json);

  final List<String> episode;

  Map<String, dynamic> toJson() => _$RhymesToJson(this);

  HistoryRhymer toHistory(String word) => HistoryRhymer(
        Uuid.v4().toString(),
        word,
        name: episode,
      );
}
