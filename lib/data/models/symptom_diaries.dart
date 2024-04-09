class SymptomDiaries {
  final String date;
  List<String>? symptomsIDs;
  String? id;
  String? hoursOfSleep;
  String? notes;
  String? waterLiters;
  String? weight;

  SymptomDiaries({
    required this.date,
    this.symptomsIDs,
    this.id,
    this.hoursOfSleep = "",
    this.notes = "",
    this.waterLiters = "",
    this.weight = "",
  });

  factory SymptomDiaries.fromJson(Map<String, dynamic> json) {
    return SymptomDiaries(
      symptomsIDs: List<String>.from(json['symptom_ids']),
      id: json['id'],
      date: json['date'],
      hoursOfSleep: json['hours_of_sleep'] ?? "",
      notes: json['notes'] ?? "",
      waterLiters: json['water_lt'] ?? "",
      weight: json['weight'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symptom_ids': symptomsIDs,
      'id': id,
      'hours_of_sleep': hoursOfSleep,
      'notes': notes,
      'water_lt': waterLiters,
      'weight': weight,
    };
  }

  @override
  String toString() {
    return 'SymptomDiaries{date: $date, symptomsIDs: $symptomsIDs, id: $id, hoursOfSleep: $hoursOfSleep, notes: $notes, waterLiters: $waterLiters, weight: $weight}';
  }
}
