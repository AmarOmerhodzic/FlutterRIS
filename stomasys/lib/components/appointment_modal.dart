import 'package:flutter/material.dart';
import '../db/appointment_database.dart'; // Import the appointment database
import '../home_screen.dart';
import '../models/appointment_model.dart'; // Import the appointment model

class AppointmentModal extends StatefulWidget {
  final int appointmentId;
  final String date;
  final String vrijeme;

  AppointmentModal({
    required this.appointmentId,
    required this.date,
    required this.vrijeme,
  });

  @override
  _AppointmentModalState createState() => _AppointmentModalState();
}

class _AppointmentModalState extends State<AppointmentModal> {
  bool isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text('Are you sure you want to set an appointmen at'),
            SizedBox(height: 15,),
            Row(
              children: [
                Text('Date: ${widget.date}'),
                SizedBox(width: 15,),
                Text('Time: ${widget.vrijeme}'),
              ],
            ),
            
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: isConfirmed
              ? null 
              : () async {
                  await AppointmentDatabase.instance.confirmAppointment(
                    widget.appointmentId,
                  );
                  setState(() {
                    isConfirmed = true;
                  });
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
                },
          child: Text('Confirm'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
