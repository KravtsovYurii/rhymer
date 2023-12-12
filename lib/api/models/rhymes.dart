import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'rhymes.g.dart';

@JsonSerializable()
@RealmModel()
class Rhymes {
  const Rhymes({required this.name});

  factory Rhymes.fromJson(Map<String, dynamic> json) => _$RhymesFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$RhymesToJson(this);
}
