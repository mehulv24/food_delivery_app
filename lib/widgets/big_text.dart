import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String data; // The text to display
  final double screenWidth; // Pass screenWidth for font size adjustment
  final Color textColor; // Text color with a default value of black87

  // Constructor with required data and screenWidth, and optional textColor with default value
  const BigText({
    super.key,
    required this.data,
    required this.screenWidth,
    this.textColor = Colors.black87, // Default value for textColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: screenWidth * 0.055,
        fontWeight: FontWeight.w900,
        color: textColor, // Use the provided or default color
      ),
    );
  }
}