import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomasys/components/custom_appbar.dart';
import 'package:stomasys/components/custom_container.dart';

import '../components/custom_button.dart';
import '../constants/color.dart';
import '../constants/image_constants.dart';



class PatientSignUp extends ConsumerStatefulWidget {
  PatientSignUp({Key? key}) : super(key: key);

  @override
  PatientSignUpState createState() => PatientSignUpState();
}

class PatientSignUpState extends ConsumerState<PatientSignUp> {
    bool isHidden = false;
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var jmbgController = TextEditingController();
    var phoneController = TextEditingController();
    var addressController = TextEditingController();
    var confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
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
      appBar: AppBarWithBackIcon(title: 'Patient', onPressed: () {
        Navigator.pop(context);
      },),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
            SizedBox(height: 15,),
            
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Username',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
        
              ),
              controller: usernameController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'First and LastName',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              ),
              controller: nameController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'E-mail',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'example@mail.com',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              ),
              controller: emailController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'JMBG',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              decoration: InputDecoration(
                hintText: '1234567891011',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10) 
              ),
              controller: jmbgController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone number',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              decoration: InputDecoration(
                hintText: '+387 123-456-789',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              ),
              controller: phoneController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Adress',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Adress',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
               contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10) 
              ),
              controller: addressController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              obscureText: !isHidden,
              decoration: InputDecoration(
                hintText: '',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                suffixIcon: InkWell(
                  onTap: _toggle,
                  child: Icon(
                    isHidden ? Icons.visibility : Icons.visibility_off,
                    color: Color.fromARGB(255, 107, 107, 107),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              ),
              controller: passwordController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Confirm password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              obscureText: !isHidden,
              decoration: InputDecoration(
                hintText: '',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstants.primaryBlue),
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                suffixIcon: InkWell(
                  onTap: _toggle,
                  child: Icon(
                    isHidden ? Icons.visibility : Icons.visibility_off,
                    color: Color.fromARGB(255, 107, 107, 107),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              ),
              controller: confirmController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 20,),
            CustomButton(
                text: 'Sign up ',
                isActive: true,
                textColor: Colors.white,
                bodyColor: ColorConstants.primaryBlue,
                buttonWidth: MediaQuery.of(context)!.size.width - 60,
                buttonHeight: 52,
                function: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Sorry, not working')));
                }),
                SizedBox(height: 20,),
          ],),
        ),
      )
    );
  }
}