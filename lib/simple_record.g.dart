// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_record.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetSimpleRecordCollection on Isar {
  IsarCollection<int, SimpleRecord> get simpleRecords => this.collection();
}

const SimpleRecordSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'SimpleRecord',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'data',
        type: IsarType.longList,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, SimpleRecord>(
    serialize: serializeSimpleRecord,
    deserialize: deserializeSimpleRecord,
    deserializeProperty: deserializeSimpleRecordProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeSimpleRecord(IsarWriter writer, SimpleRecord object) {
  {
    final list = object.data;
    final listWriter = IsarCore.beginList(writer, 1, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeLong(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
SimpleRecord deserializeSimpleRecord(IsarReader reader) {
  final object = SimpleRecord();
  object.id = IsarCore.readId(reader);
  {
    final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.data = const <int>[];
      } else {
        final list =
            List<int>.filled(length, -9223372036854775808, growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readLong(reader, i);
        }
        IsarCore.freeReader(reader);
        object.data = list;
      }
    }
  }
  return object;
}

@isarProtected
dynamic deserializeSimpleRecordProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <int>[];
          } else {
            final list =
                List<int>.filled(length, -9223372036854775808, growable: true);
            for (var i = 0; i < length; i++) {
              list[i] = IsarCore.readLong(reader, i);
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

extension SimpleRecordQueryFilter
    on QueryBuilder<SimpleRecord, SimpleRecord, QFilterCondition> {
  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      dataElementEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      dataElementGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      dataElementGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      dataElementLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      dataElementLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      dataElementBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      dataIsEmpty() {
    return not().dataIsNotEmpty();
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterFilterCondition>
      dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 1, value: null),
      );
    });
  }
}

extension SimpleRecordQueryObject
    on QueryBuilder<SimpleRecord, SimpleRecord, QFilterCondition> {}

extension SimpleRecordQuerySortBy
    on QueryBuilder<SimpleRecord, SimpleRecord, QSortBy> {
  QueryBuilder<SimpleRecord, SimpleRecord, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }
}

extension SimpleRecordQuerySortThenBy
    on QueryBuilder<SimpleRecord, SimpleRecord, QSortThenBy> {
  QueryBuilder<SimpleRecord, SimpleRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<SimpleRecord, SimpleRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }
}

extension SimpleRecordQueryWhereDistinct
    on QueryBuilder<SimpleRecord, SimpleRecord, QDistinct> {
  QueryBuilder<SimpleRecord, SimpleRecord, QAfterDistinct> distinctByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }
}

extension SimpleRecordQueryProperty1
    on QueryBuilder<SimpleRecord, SimpleRecord, QProperty> {
  QueryBuilder<SimpleRecord, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<SimpleRecord, List<int>, QAfterProperty> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension SimpleRecordQueryProperty2<R>
    on QueryBuilder<SimpleRecord, R, QAfterProperty> {
  QueryBuilder<SimpleRecord, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<SimpleRecord, (R, List<int>), QAfterProperty> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension SimpleRecordQueryProperty3<R1, R2>
    on QueryBuilder<SimpleRecord, (R1, R2), QAfterProperty> {
  QueryBuilder<SimpleRecord, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<SimpleRecord, (R1, R2, List<int>), QOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}
