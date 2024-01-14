import 'package:flutter/material.dart';
import 'package:stomasys/constants/color.dart';

class CustomContainer extends StatefulWidget {
  final String text;
  final double buttonWidth;
  const CustomContainer({
    Key? key,
    required this.text,
    required this.buttonWidth,
  }) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    // Adjust the border radius as needed
    const double borderRadius = 25.0;

    return SizedBox(
      width: widget.buttonWidth,
      height: 62,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.primaryBlue,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
