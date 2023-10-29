import 'package:flutter/material.dart';
import 'package:tthh_navidad/app_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final String text;

  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.orangeAccent.withOpacity(1),
        backgroundColor: Colors.orangeAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.orangeAccent[700]!, width: 3.5),
        ),
        minimumSize: Size(width, 60),
      ),
      child: Text(text, style: AppTheme.tsTitle),
    );
  }
}
