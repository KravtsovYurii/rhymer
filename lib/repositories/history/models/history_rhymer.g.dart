// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_rhymer.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HistoryRhymer extends _HistoryRhymer
    with RealmEntity, RealmObjectBase, RealmObject {
  HistoryRhymer(
    String id,
    String name,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
  }

  HistoryRhymer._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<HistoryRhymer>> get changes =>
      RealmObjectBase.getChanges<HistoryRhymer>(this);

  @override
  HistoryRhymer freeze() => RealmObjectBase.freezeObject<HistoryRhymer>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(HistoryRhymer._);
    return const SchemaObject(
        ObjectType.realmObject, HistoryRhymer, 'HistoryRhymer', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}
