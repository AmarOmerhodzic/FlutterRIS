import 'package:flutter/material.dart';

import '../components/custom_appbar.dart';
import '../components/custom_button.dart';
import '../constants/color.dart';

class ClinicSignUp extends StatefulWidget {
  ClinicSignUp({Key? key}) : super(key: key);

  @override
  ClinicSignUpState createState() => ClinicSignUpState();
}

class ClinicSignUpState extends State<ClinicSignUp> {
  bool isHidden = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var jmbgController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var confirmController = TextEditingController();
  var clinicUsernameController = TextEditingController();
  var clinicAdressController = TextEditingController();
  var clinicCityController = TextEditingController();
  var clinicDescriptionController = TextEditingController();

  int selectedTabIndex = 0;

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

  void onTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryBackgroundColor,
      appBar: AppBarWithBackIcon(
        title: 'Clinic',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onTabSelected(0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedTabIndex == 0
                              ? ColorConstants.primaryBlue
                              : ColorConstants.primaryBackgroundColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft:Radius.circular(20)  ),
                          border: Border.all(color: ColorConstants.primaryBlue)
                        ),
                        child: Center(
                          child: Text(
                            'Clinic info',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedTabIndex == 0
                                  ? ColorConstants.primaryBackgroundColor
                                  : ColorConstants.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onTabSelected(1),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedTabIndex == 1
                              ? ColorConstants.primaryBlue
                              : ColorConstants.primaryBackgroundColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight:Radius.circular(20)),
                          border: Border.all(color: ColorConstants.primaryBlue)
                        ),
                        child: Center(
                          child: Text(
                            'Doctor info',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedTabIndex == 1
                                  ? ColorConstants.primaryBackgroundColor
                                  : ColorConstants.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              selectedTabIndex == 0 
              ? Column(children: [
                  Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Clinic name',
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
              controller: clinicUsernameController,
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
                'Address',
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
              controller: clinicAdressController,
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
                'City',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue),
              ),
            ),
            SizedBox(height: 4),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'City',
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
              controller: clinicCityController,
              /*  validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.required;
                }
                return null;
              }, */
            ),
            SizedBox(height: 15,),
            Column(
                    children: [
                      Row(
                        children:[ 
                          Expanded(
                            child: Text(
                              'Description',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal, color: ColorConstants.primaryBlue
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      SizedBox(
                        height: 141,
                        child: TextField(
                          controller: clinicDescriptionController,
                          style: TextStyle(
                            color: ColorConstants.primaryBlue,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.multiline,
                          minLines: null,
                          maxLines: 18,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: 'Write description',
                            hintStyle: TextStyle(
                              color: ColorConstants.primaryBlue
                            ) ,
                            border: OutlineInputBorder(borderSide: BorderSide(color: ColorConstants.primaryBlue)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorConstants.primaryBlue)),
                          ),
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 15,),
                CustomButton(
                text: 'Next',
                isActive: true,
                textColor: Colors.white,
                bodyColor: ColorConstants.primaryBlue,
                buttonWidth: MediaQuery.of(context)!.size.width - 60,
                buttonHeight: 52,
                function: () {
                  onTabSelected(1);
                }),
              ],) 
              : Column(
                children: [
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
