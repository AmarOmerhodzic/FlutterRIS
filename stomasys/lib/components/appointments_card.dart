import 'package:flutter/material.dart';
import 'package:stomasys/constants/color.dart';

class ClinicCard extends StatelessWidget {
  final String datum;
  final String vrijeme;
  final bool taken;

  ClinicCard({required this.datum, required this.vrijeme, this.taken = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: taken ? ColorConstants.green : ColorConstants.primaryBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              datum,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              vrijeme,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
