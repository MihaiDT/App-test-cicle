import 'package:hive_flutter/hive_flutter.dart';
import 'package:lines/data/models/symptom_category.dart';

class SymptomCategoryAdapter extends TypeAdapter<SymptomCategory> {
  @override
  final int typeId = 2;

  @override
  SymptomCategory read(BinaryReader reader) {
    return SymptomCategory(
      categoryTitle: reader.read(),
      categoryIconPath: reader.read(),
      categoryIndex: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, SymptomCategory obj) {
    writer.write(obj.categoryTitle);
    writer.write(obj.categoryIconPath);
    writer.write(obj.categoryIndex);
  }
}
