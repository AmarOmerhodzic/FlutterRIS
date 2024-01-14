import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomasys/components/custom_appbar.dart';
import 'package:stomasys/home_screen.dart';

import '../components/custom_button.dart';
import '../constants/color.dart';
import '../constants/image_constants.dart';
import '../db/user_database.dart';



class LogOutScreen extends ConsumerStatefulWidget {
  LogOutScreen({Key? key}) : super(key: key);

  @override
  LogOutScreenState createState() => LogOutScreenState();
}

class LogOutScreenState extends ConsumerState<LogOutScreen> {


  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ColorConstants.primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 300,),

          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
                  text: 'Log out',
                  isActive: true,
                  textColor: ColorConstants.primaryBlue,
                  bodyColor: ColorConstants.primaryBackgroundColor,
                  buttonWidth: MediaQuery.of(context)!.size.width - 60,
                  buttonHeight: 52,
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogOutScreen(),
                        
                      ),
                    );
                  }),
          ), 
        ],),
      )
    );
  }
}