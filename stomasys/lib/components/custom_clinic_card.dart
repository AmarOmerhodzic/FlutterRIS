import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stomasys/constants/state_management.dart';
import 'package:stomasys/gradovi/gradovi_screen.dart';

import '../clinic/pregled_termina.dart';
import '../constants/color.dart';
import '../db/clinic_database.dart';
import 'custom_button.dart';

class ClinicCards {
  final int id;
  final String nameOfClinic;
  final String descriptionOfClinic;

  ClinicCards({
    required this.id,
    required this.nameOfClinic,
    required this.descriptionOfClinic,
  });
}
class MembershipCardComponent extends StatefulWidget {
  @override
  _MembershipCardComponentState createState() =>
      _MembershipCardComponentState();
}

int currentIndex = 0;

class _MembershipCardComponentState extends State<MembershipCardComponent> {

  List<ClinicCards>? memberCards;

  @override
  void initState() {
   loadClinics();
    super.initState();
  }
  Future<void> loadClinics() async {
    // Fetch clinics from the database based on the selected city
    final fetchedClinics = await ClinicDatabase.instance.getClinicsByCity(Constants.selectedCity);

    setState(() {
      memberCards = fetchedClinics
          .map(
            (clinic) => ClinicCards(
              id: clinic.id ?? 0,
              nameOfClinic: clinic.name,
              descriptionOfClinic: clinic.description,
            ),
          )
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (memberCards != null)
        CarouselSlider.builder(
          itemCount: memberCards?.length,
          options: CarouselOptions(
            aspectRatio: 1.1,
            height: 250,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.71,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 15),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, _) {
            var memberCard = memberCards?[index];
            return buildMembershipCard(
              memberCard?.id ?? 0,
              memberCard?.nameOfClinic ?? '',
                memberCard?.descriptionOfClinic ?? '',
            );
          },
        ),
        if (memberCards != null)
        buildIndicator(memberCards?.length ?? 0),
      ],
    );
  }

  Widget buildMembershipCard(
      int clinicId,
      String nameOfClinic,
      String descriptionOfClinic,) {

    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
        color: Colors.white,

      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 45),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                nameOfClinic,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorConstants.primaryBlue),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                descriptionOfClinic,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ColorConstants.primaryBlue),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
                text: 'Check appointments',
                isActive: true,
                textColor: Colors.white,
                bodyColor: ColorConstants.primaryBlue,
                buttonWidth: MediaQuery.of(context)!.size.width - 100,
                buttonHeight: 42,
                textHeight: 16,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PegledTerminaScreen(clinicId: clinicId,),
                      settings:  RouteSettings(
                            arguments:{ 
                              'clinicName': nameOfClinic,
                              'clinicDescription': descriptionOfClinic, 
                            }
                          )
                      
                    ),
                  );
                }),
          ),
        ],
      ),
    
    );
  }

  Widget buildIndicator(int itemCount) {
    return Container(
      width: MediaQuery.of(context)!.size.width - 40,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '${currentIndex + 1} / $itemCount',
          style: TextStyle(
              color: ColorConstants.primaryBlue,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ]),
    );
  }
}


