import 'package:hive_flutter/hive_flutter.dart';
import 'package:lines/data/models/symptom.dart';

class SymptomAdapter extends TypeAdapter<Symptom> {
  @override
  final int typeId = 1;

  @override
  Symptom read(BinaryReader reader) {
    return Symptom(
      symptomName: reader.read(),
      iconPath: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Symptom obj) {
    writer.write(obj.symptomName);
    writer.write(obj.iconPath);
  }
}
