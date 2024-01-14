import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:stomasys/db/appointment_database.dart';
import 'package:stomasys/db/clinic_database.dart';
import 'package:stomasys/db/user_database.dart';
import 'package:stomasys/models/appointment_model.dart';
import 'package:stomasys/models/clinic_model.dart';
import 'package:stomasys/models/user_model.dart';
import 'package:stomasys/startup.dart';

import 'auth/login_screen.dart';
import 'constants/color.dart';
import 'constants/image_constants.dart';
import 'db/city_database.dart';
import 'helpers/shared_preference.dart';
import 'models/city_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> with RouteAware {
  bool? executed;
  @override
  void initState() {
    super.initState();
    executed = singleton.get<SharedPreferencesHelper>().getExecuted();
    initializeApp();
  }

  Future<void> initializeApp() async {
    if(executed != true){
      await insertDefaultUser(); 
      await insertDefaultCities();
      await insertDefaultClinics();
      await insertDefaultAppointments();
      singleton.get<SharedPreferencesHelper>().setExecuted();
    }  

    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }


  Future<void> insertDefaultUser() async {
    final database = await UserDatabase.instance.database;

    await UserDatabase.instance.insertUser(User(username: 'pacijent', password: 'password'));
  }
  Future<void> insertDefaultCities() async {
    final database = await CitieDatabase.instance.database;

    await CitieDatabase.instance.insertCity(City(name: 'Zenica'));

  }
  Future<void> insertDefaultClinics() async {
    final database = await ClinicDatabase.instance.database;

    await ClinicDatabase.instance.insertClinic(Clinic(name: 'Clinic 1', cityId: 1, description: 'Description of Clinic 1', ));
    await ClinicDatabase.instance.insertClinic(Clinic(name: 'Clinic 2', cityId: 1, description: 'Description of Clinic 2', ));
    await ClinicDatabase.instance.insertClinic(Clinic(name: 'Clinic 3', cityId: 1, description: 'Description of Clinic 3', ));
  }
  Future<void> insertDefaultAppointments() async {
    final database = await AppointmentDatabase.instance.database;

    await AppointmentDatabase.instance.insertAppointment(Appointment(date: '14.01.2024', time: '8:00', taken: false, clinicId: 1, ));
    await AppointmentDatabase.instance.insertAppointment(Appointment(date: '14.01.2024', time: '12:00', taken: false, clinicId: 1, ));
    await AppointmentDatabase.instance.insertAppointment(Appointment(date: '14.01.2024', time: '15:00', taken: false, clinicId: 1, ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryBackgroundColor,
      body: Center(child: Image.asset(AllImages().logo)),
    );
  }
}
