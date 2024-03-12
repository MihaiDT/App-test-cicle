// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_calendar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSymptomCalendarCollection on Isar {
  IsarCollection<SymptomCalendar> get symptomCalendars => this.collection();
}

const SymptomCalendarSchema = CollectionSchema(
  name: r'SymptomCalendar',
  id: -749204566836369452,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    )
  },
  estimateSize: _symptomCalendarEstimateSize,
  serialize: _symptomCalendarSerialize,
  deserialize: _symptomCalendarDeserialize,
  deserializeProp: _symptomCalendarDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'symptoms': LinkSchema(
      id: 4416157220632556507,
      name: r'symptoms',
      target: r'Symptom',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _symptomCalendarGetId,
  getLinks: _symptomCalendarGetLinks,
  attach: _symptomCalendarAttach,
  version: '3.1.0+1',
);

int _symptomCalendarEstimateSize(
  SymptomCalendar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  return bytesCount;
}

void _symptomCalendarSerialize(
  SymptomCalendar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
}

SymptomCalendar _symptomCalendarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SymptomCalendar();
  object.date = reader.readString(offsets[0]);
  object.id = id;
  return object;
}

P _symptomCalendarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _symptomCalendarGetId(SymptomCalendar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _symptomCalendarGetLinks(SymptomCalendar object) {
  return [object.symptoms];
}

void _symptomCalendarAttach(
    IsarCollection<dynamic> col, Id id, SymptomCalendar object) {
  object.id = id;
  object.symptoms.attach(col, col.isar.collection<Symptom>(), r'symptoms', id);
}

extension SymptomCalendarQueryWhereSort
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QWhere> {
  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SymptomCalendarQueryWhere
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QWhereClause> {
  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterWhereClause> dateEqualTo(
      String date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterWhereClause>
      dateNotEqualTo(String date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SymptomCalendarQueryFilter
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QFilterCondition> {
  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SymptomCalendarQueryObject
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QFilterCondition> {}

extension SymptomCalendarQueryLinks
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QFilterCondition> {
  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      symptoms(FilterQuery<Symptom> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'symptoms');
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      symptomsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', length, true, length, true);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      symptomsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', 0, true, 0, true);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      symptomsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', 0, false, 999999, true);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      symptomsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', 0, true, length, include);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      symptomsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', length, include, 999999, true);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterFilterCondition>
      symptomsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'symptoms', lower, includeLower, upper, includeUpper);
    });
  }
}

extension SymptomCalendarQuerySortBy
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QSortBy> {
  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension SymptomCalendarQuerySortThenBy
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QSortThenBy> {
  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SymptomCalendar, SymptomCalendar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension SymptomCalendarQueryWhereDistinct
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QDistinct> {
  QueryBuilder<SymptomCalendar, SymptomCalendar, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }
}

extension SymptomCalendarQueryProperty
    on QueryBuilder<SymptomCalendar, SymptomCalendar, QQueryProperty> {
  QueryBuilder<SymptomCalendar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SymptomCalendar, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }
}
