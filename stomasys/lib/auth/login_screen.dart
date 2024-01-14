import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomasys/components/custom_appbar.dart';
import 'package:stomasys/home_screen.dart';

import '../components/custom_button.dart';
import '../constants/color.dart';
import '../constants/image_constants.dart';
import '../db/user_database.dart';
import 'choose_screen.dart';



class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
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
  Future<void> _login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    final user = await UserDatabase.instance.getUser(username, password);

    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Wrong credentials, try again!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ColorConstants.primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
          Center(child: Image.asset(AllImages().logo, width: 160,height: 113,)),
          SizedBox(height: 10,),
          Column(children: [
            Text('Hello!', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: ColorConstants.primaryBlue),),
            SizedBox(height: 5,),
            Text('Please enter your credentials', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),)
          ],),
          SizedBox(height: 10,),
          Container(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Wrap(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                      'Username',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
                    ),
                    SizedBox(height: 4),
                    TextFormField(                   
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstants.primaryBlue),
                          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConstants.primaryBlue),
                          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                        ),
                      ),
                      controller: usernameController,
                      /* validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.required;
                        }
                        return null;
                      }, */
                    ),
                    SizedBox(height: 15,),
                  Text(
                      'Password',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      obscureText: !isHidden,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
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
                      ),
                      controller: passwordController,
                     /*  validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.required;
                        }
                        return null;
                      }, */
                    ),
                        ]),                 
                  ])),
                 SizedBox(height: 40,),
          CustomButton(
                text: 'Login',
                isActive: true,
                textColor: Colors.white,
                bodyColor: ColorConstants.primaryBlue,
                buttonWidth: MediaQuery.of(context)!.size.width - 60,
                buttonHeight: 52,
                function: () {
                  _login();
                }),
                SizedBox(height: 20,),
          CustomButton(
                text: 'Sign up',
                isActive: true,
                textColor: ColorConstants.primaryBlue,
                bodyColor: ColorConstants.primaryBackgroundColor,
                buttonWidth: MediaQuery.of(context)!.size.width - 60,
                buttonHeight: 52,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseScreen(),
                      
                    ),
                  );
                }), 
        ],),
      )
    );
  }
}