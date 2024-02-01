// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'src/core/edge.dart';
import 'src/core/stored_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 558472238247110588),
      name: 'StoredModel',
      lastPropertyId: const IdUid(10, 2549338757021133798),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(5, 1670691126551255771),
            name: 'data',
            type: 27,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8517823934046097834),
            name: 'internalKey',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(8, 6384742371353474694),
            name: 'type',
            type: 9,
            flags: 2048,
            indexId: const IdUid(5, 730803953799336297)),
        ModelProperty(
            id: const IdUid(9, 6254148759314699956),
            name: 'id',
            type: 9,
            flags: 2048,
            indexId: const IdUid(6, 7922958283474305591)),
        ModelProperty(
            id: const IdUid(10, 2549338757021133798),
            name: 'isInt',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 1917868895498693994),
      name: 'Edge',
      lastPropertyId: const IdUid(5, 3519156960029563844),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3619357113742929565),
            name: 'internalKey',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 7693532148362531257),
            name: 'from',
            type: 9,
            flags: 2048,
            indexId: const IdUid(7, 7657818943958596044)),
        ModelProperty(
            id: const IdUid(3, 5493254925867336679),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3468009821756474552),
            name: 'to',
            type: 9,
            flags: 2048,
            indexId: const IdUid(8, 9044044871479917674)),
        ModelProperty(
            id: const IdUid(5, 3519156960029563844),
            name: 'inverseName',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(5, 1917868895498693994),
      lastIndexId: const IdUid(8, 9044044871479917674),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [
        774660918014734042,
        4321048807070347777,
        2274314607667245351
      ],
      retiredIndexUids: const [4475679244263981404, 1851741414108672316],
      retiredPropertyUids: const [
        9125859889595128857,
        6229123358566821214,
        7023346375686282707,
        5746187496170857728,
        8735621994409590115,
        7966431342472525511,
        1272561439525881874,
        6723244145385536321,
        3614265771307477278,
        4748409496125217799,
        4097118525468747544,
        3715749524209619983,
        877310601265162898,
        4404648571096838414,
        4576645711318044710,
        4149618469556355365
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    StoredModel: EntityDefinition<StoredModel>(
        model: _entities[0],
        toOneRelations: (StoredModel object) => [],
        toManyRelations: (StoredModel object) => {},
        getId: (StoredModel object) => object.internalKey,
        setId: (StoredModel object, int id) {
          object.internalKey = id;
        },
        objectToFB: (StoredModel object, fb.Builder fbb) {
          final dataOffset =
              object.data == null ? null : fbb.writeListInt64(object.data!);
          final typeOffset = fbb.writeString(object.type);
          final idOffset =
              object.id == null ? null : fbb.writeString(object.id!);
          fbb.startTable(11);
          fbb.addOffset(4, dataOffset);
          fbb.addInt64(6, object.internalKey);
          fbb.addOffset(7, typeOffset);
          fbb.addOffset(8, idOffset);
          fbb.addBool(9, object.isInt);
          fbb.finish(fbb.endTable());
          return object.internalKey;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final internalKeyParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          final typeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 18, '');
          final idParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 20);
          final isIntParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 22, false);
          final dataParam =
              const fb.ListReader<int>(fb.Int64Reader(), lazy: false)
                  .vTableGetNullable(buffer, rootOffset, 12);
          final object = StoredModel(
              internalKey: internalKeyParam,
              type: typeParam,
              id: idParam,
              isInt: isIntParam,
              data: dataParam);

          return object;
        }),
    Edge: EntityDefinition<Edge>(
        model: _entities[1],
        toOneRelations: (Edge object) => [],
        toManyRelations: (Edge object) => {},
        getId: (Edge object) => object.internalKey,
        setId: (Edge object, int id) {
          object.internalKey = id;
        },
        objectToFB: (Edge object, fb.Builder fbb) {
          final fromOffset = fbb.writeString(object.from);
          final nameOffset = fbb.writeString(object.name);
          final toOffset = fbb.writeString(object.to);
          final inverseNameOffset = object.inverseName == null
              ? null
              : fbb.writeString(object.inverseName!);
          fbb.startTable(6);
          fbb.addInt64(0, object.internalKey);
          fbb.addOffset(1, fromOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, toOffset);
          fbb.addOffset(4, inverseNameOffset);
          fbb.finish(fbb.endTable());
          return object.internalKey;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final fromParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final toParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final inverseNameParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12);
          final object = Edge(
              from: fromParam,
              name: nameParam,
              to: toParam,
              inverseName: inverseNameParam)
            ..internalKey =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [StoredModel] entity fields to define ObjectBox queries.
class StoredModel_ {
  /// see [StoredModel.data]
  static final data =
      QueryIntegerVectorProperty<StoredModel>(_entities[0].properties[0]);

  /// see [StoredModel.internalKey]
  static final internalKey =
      QueryIntegerProperty<StoredModel>(_entities[0].properties[1]);

  /// see [StoredModel.type]
  static final type =
      QueryStringProperty<StoredModel>(_entities[0].properties[2]);

  /// see [StoredModel.id]
  static final id =
      QueryStringProperty<StoredModel>(_entities[0].properties[3]);

  /// see [StoredModel.isInt]
  static final isInt =
      QueryBooleanProperty<StoredModel>(_entities[0].properties[4]);
}

/// [Edge] entity fields to define ObjectBox queries.
class Edge_ {
  /// see [Edge.internalKey]
  static final internalKey =
      QueryIntegerProperty<Edge>(_entities[1].properties[0]);

  /// see [Edge.from]
  static final from = QueryStringProperty<Edge>(_entities[1].properties[1]);

  /// see [Edge.name]
  static final name = QueryStringProperty<Edge>(_entities[1].properties[2]);

  /// see [Edge.to]
  static final to = QueryStringProperty<Edge>(_entities[1].properties[3]);

  /// see [Edge.inverseName]
  static final inverseName =
      QueryStringProperty<Edge>(_entities[1].properties[4]);
}
