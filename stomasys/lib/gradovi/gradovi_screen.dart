import 'package:flutter/material.dart';
import 'package:stomasys/components/custom_appbar.dart';
import 'package:stomasys/components/custom_button.dart';
import 'package:stomasys/constants/color.dart';
import 'package:stomasys/constants/image_constants.dart';
import 'package:stomasys/constants/state_management.dart';
import 'package:stomasys/models/city_model.dart';

import '../components/custom_clinic_card.dart';
import '../db/city_database.dart';

class GradoviScreen extends StatefulWidget {
  GradoviScreen({Key? key}) : super(key: key);

  @override
  GradoviScreenState createState() => GradoviScreenState();
}

class GradoviScreenState extends State<GradoviScreen> {
  bool isHidden = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  List<City> cities = []; // List to store cities from the database
  String? selectedCity;
  int? slctdCityNumber;

  @override
  void initState() {
    super.initState();
    loadCities(); // Fetch cities when the screen initializes
  }

  Future<void> loadCities() async {
    // Fetch cities from the database
    final fetchedCities = await CitieDatabase.instance.getAllCities();

    setState(() {
      cities = fetchedCities;
      selectedCity = cities.isNotEmpty ? cities[0].name : null;
      slctdCityNumber = cities.isNotEmpty ? cities[0].id : 0;
      Constants.setSelectedCity(slctdCityNumber ?? 0);
    });
  }

  void _toggle() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Image.asset(
                AllImages().logo,
                width: 160,
                height: 113,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose city:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.primaryBlue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: DropdownButtonFormField<City?>(
                value: cities.isNotEmpty ? cities[0] : null,
                onChanged: (City? newValue) {
                  setState(() {
                    selectedCity = newValue?.name;
                    slctdCityNumber = newValue?.id;
                    Constants.setSelectedCity(slctdCityNumber ?? 0);
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: [
                  DropdownMenuItem<City?>(
                    value: null,
                    child: Text('Select a city'),
                  ),
                  ...cities.map((City city) {
                    return DropdownMenuItem<City?>(
                      value: city,
                      child: Text(city.name),
                    );
                  }).toList(),
                ],
              ),
            ),

            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available clinics',
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
            Column(
              children: [
                SizedBox(height: 40),
                MembershipCardComponent(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
