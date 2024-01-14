class Clinic {
  final int? id;
  final String name;
  final String description;
  final int cityId; 

  Clinic({
    this.id,
    required this.name,
    required this.description,
    required this.cityId, 
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'cityId': cityId, 
    };
  }

  factory Clinic.fromMap(Map<String, dynamic> map) {
    return Clinic(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      cityId: map['cityId'], 
    );
  }
}
