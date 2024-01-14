import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomasys/components/custom_appbar.dart';
import 'package:stomasys/home_screen.dart';

import '../components/appointment_modal.dart';
import '../components/appointments_card.dart';
import '../components/custom_button.dart';
import '../constants/color.dart';
import '../constants/image_constants.dart';
import '../db/appointment_database.dart'; // Import the appointment database
import '../models/appointment_model.dart'; // Import the appointment model

class PegledTerminaScreen extends ConsumerStatefulWidget {
  final int clinicId;
  PegledTerminaScreen({required this.clinicId, Key? key}) : super(key: key);

  @override
  PegledTerminaScreenState createState() => PegledTerminaScreenState();
}

class PegledTerminaScreenState extends ConsumerState<PegledTerminaScreen> {
  late List<Appointment> appointments = [];

  @override
  void initState() {
    super.initState();
    loadAppointments();
  }

  Future<void> loadAppointments() async {
    // Fetch appointments from the database based on the clinicId
    appointments =
        await AppointmentDatabase.instance.getAppointmentsByClinic(widget.clinicId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
            as Map;
    String clinicName = arguments['clinicName'] ?? '';
    String description = arguments['clinicDescription'] ?? '';

    return Scaffold(
      appBar: AppBarWithBackIcon(
        title: 'Clinics appointments',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: ColorConstants.primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          clinicName,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.primaryBlue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          description,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available appointments',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.primaryBlue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 2,
                  width: (MediaQuery.of(context)!.size.width / 100) * 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.primaryBlue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: AppointmentModal(
                            appointmentId: appointment.id ?? 1,
                            date: appointment.date,
                            vrijeme: appointment.time,
                          ),
                        );
                      },
                    );
                  },
                  child: ClinicCard(
                    taken: appointment.taken,
                    datum: appointment.date,
                    vrijeme: appointment.time,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
