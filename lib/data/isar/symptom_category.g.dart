// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_category.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSymptomCategoryCollection on Isar {
  IsarCollection<SymptomCategory> get symptomCategorys => this.collection();
}

const SymptomCategorySchema = CollectionSchema(
  name: r'SymptomCategory',
  id: 5083575965934557955,
  properties: {
    r'iconPath': PropertySchema(
      id: 0,
      name: r'iconPath',
      type: IsarType.string,
    ),
    r'inHome': PropertySchema(
      id: 1,
      name: r'inHome',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'position': PropertySchema(
      id: 3,
      name: r'position',
      type: IsarType.long,
    )
  },
  estimateSize: _symptomCategoryEstimateSize,
  serialize: _symptomCategorySerialize,
  deserialize: _symptomCategoryDeserialize,
  deserializeProp: _symptomCategoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'position': IndexSchema(
      id: 5117117876086213592,
      name: r'position',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'position',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'symptoms': LinkSchema(
      id: 1412685795648885777,
      name: r'symptoms',
      target: r'Symptom',
      single: false,
      linkName: r'category',
    )
  },
  embeddedSchemas: {},
  getId: _symptomCategoryGetId,
  getLinks: _symptomCategoryGetLinks,
  attach: _symptomCategoryAttach,
  version: '3.1.0+1',
);

int _symptomCategoryEstimateSize(
  SymptomCategory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.iconPath.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _symptomCategorySerialize(
  SymptomCategory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.iconPath);
  writer.writeBool(offsets[1], object.inHome);
  writer.writeString(offsets[2], object.name);
  writer.writeLong(offsets[3], object.position);
}

SymptomCategory _symptomCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SymptomCategory();
  object.iconPath = reader.readString(offsets[0]);
  object.id = id;
  object.inHome = reader.readBool(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.position = reader.readLong(offsets[3]);
  return object;
}

P _symptomCategoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _symptomCategoryGetId(SymptomCategory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _symptomCategoryGetLinks(SymptomCategory object) {
  return [object.symptoms];
}

void _symptomCategoryAttach(
    IsarCollection<dynamic> col, Id id, SymptomCategory object) {
  object.id = id;
  object.symptoms.attach(col, col.isar.collection<Symptom>(), r'symptoms', id);
}

extension SymptomCategoryQueryWhereSort
    on QueryBuilder<SymptomCategory, SymptomCategory, QWhere> {
  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhere> anyPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'position'),
      );
    });
  }
}

extension SymptomCategoryQueryWhere
    on QueryBuilder<SymptomCategory, SymptomCategory, QWhereClause> {
  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause>
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

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause> idBetween(
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

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause>
      positionEqualTo(int position) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'position',
        value: [position],
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause>
      positionNotEqualTo(int position) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'position',
              lower: [],
              upper: [position],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'position',
              lower: [position],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'position',
              lower: [position],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'position',
              lower: [],
              upper: [position],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause>
      positionGreaterThan(
    int position, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'position',
        lower: [position],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause>
      positionLessThan(
    int position, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'position',
        lower: [],
        upper: [position],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterWhereClause>
      positionBetween(
    int lowerPosition,
    int upperPosition, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'position',
        lower: [lowerPosition],
        includeLower: includeLower,
        upper: [upperPosition],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SymptomCategoryQueryFilter
    on QueryBuilder<SymptomCategory, SymptomCategory, QFilterCondition> {
  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconPath',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      iconPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconPath',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
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

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
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

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
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

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      inHomeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inHome',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      positionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      positionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      positionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      positionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'position',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SymptomCategoryQueryObject
    on QueryBuilder<SymptomCategory, SymptomCategory, QFilterCondition> {}

extension SymptomCategoryQueryLinks
    on QueryBuilder<SymptomCategory, SymptomCategory, QFilterCondition> {
  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      symptoms(FilterQuery<Symptom> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'symptoms');
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      symptomsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', length, true, length, true);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      symptomsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', 0, true, 0, true);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      symptomsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', 0, false, 999999, true);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      symptomsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', 0, true, length, include);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
      symptomsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'symptoms', length, include, 999999, true);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterFilterCondition>
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

extension SymptomCategoryQuerySortBy
    on QueryBuilder<SymptomCategory, SymptomCategory, QSortBy> {
  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      sortByIconPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      sortByIconPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.desc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy> sortByInHome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inHome', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      sortByInHomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inHome', Sort.desc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      sortByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      sortByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }
}

extension SymptomCategoryQuerySortThenBy
    on QueryBuilder<SymptomCategory, SymptomCategory, QSortThenBy> {
  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      thenByIconPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      thenByIconPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.desc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy> thenByInHome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inHome', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      thenByInHomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inHome', Sort.desc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      thenByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QAfterSortBy>
      thenByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }
}

extension SymptomCategoryQueryWhereDistinct
    on QueryBuilder<SymptomCategory, SymptomCategory, QDistinct> {
  QueryBuilder<SymptomCategory, SymptomCategory, QDistinct> distinctByIconPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QDistinct> distinctByInHome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inHome');
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SymptomCategory, SymptomCategory, QDistinct>
      distinctByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'position');
    });
  }
}

extension SymptomCategoryQueryProperty
    on QueryBuilder<SymptomCategory, SymptomCategory, QQueryProperty> {
  QueryBuilder<SymptomCategory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SymptomCategory, String, QQueryOperations> iconPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconPath');
    });
  }

  QueryBuilder<SymptomCategory, bool, QQueryOperations> inHomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inHome');
    });
  }

  QueryBuilder<SymptomCategory, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SymptomCategory, int, QQueryOperations> positionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'position');
    });
  }
}
