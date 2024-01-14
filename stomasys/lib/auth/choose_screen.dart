import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomasys/auth/clinic_signup.dart';
import 'package:stomasys/auth/patient_signup.dart';
import 'package:stomasys/components/custom_appbar.dart';
import 'package:stomasys/components/custom_container.dart';

import '../components/custom_button.dart';
import '../constants/color.dart';
import '../constants/image_constants.dart';



class ChooseScreen extends ConsumerStatefulWidget {
  ChooseScreen({Key? key}) : super(key: key);

  @override
  ChooseScreenState createState() => ChooseScreenState();
}

class ChooseScreenState extends ConsumerState<ChooseScreen> {
    bool isHidden = false;
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();

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
      appBar: AppBarWithBackIcon(title: 'Choose', onPressed: () {
        Navigator.pop(context);
      },),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
          Center(child: Image.asset(AllImages().logo, width: 160,height: 113,)),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Align(alignment: Alignment.centerLeft, child: Text('Sign up as:', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: ColorConstants.primaryBlue),)),
          ),
          SizedBox(height: 60,),
          CustomButton(
                text: 'Patient',
                isActive: true,
                textColor: Colors.white,
                bodyColor: ColorConstants.primaryBlue,
                buttonWidth: MediaQuery.of(context)!.size.width - 60,
                buttonHeight: 52,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientSignUp(),
                      
                    ),
                  );
                }),
          Container(
                  padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 2,
                            width:
                                (MediaQuery.of(context)!.size.width / 100) * 30,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorConstants.primaryBlue))),
                        Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              'Or',
                              style:
                                  TextStyle(color: ColorConstants.primaryBlue, fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                        Container(
                            height: 2,
                            width:
                                (MediaQuery.of(context)!.size.width / 100) * 30,
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorConstants.primaryBlue)))
                      ]),
                ),
                
          CustomButton(
                text: 'Clinic',
                isActive: true,
                textColor: Colors.white,
                bodyColor: ColorConstants.primaryBlue,
                buttonWidth: MediaQuery.of(context)!.size.width - 60,
                buttonHeight: 52,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClinicSignUp(),
                      
                    ),
                  );
                }),
        ],),
      )
    );
  }
}