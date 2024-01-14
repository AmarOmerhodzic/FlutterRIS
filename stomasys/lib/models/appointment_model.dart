class Appointment {
  final int? id;
  final String date;
  final String time;
  final int clinicId;
  final bool taken;

  Appointment({
    this.id,
    required this.date,
    required this.time,
    required this.clinicId,
    required this.taken,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'clinicId': clinicId,
      'taken': taken ? 1 : 0,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      date: map['date'],
      time: map['time'],
      clinicId: map['clinicId'],
      taken: map['taken'] == 1,
    );
  }
}
