import 'package:flutter/material.dart';

import 'package:tthh_navidad/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String initialText;

  const CustomTextField(
      {super.key, required this.label, required this.initialText});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.transparent, // Color de la sombra
              spreadRadius: 0, // Extensión de la sombra
              blurRadius: .25, // Difuminado de la sombra
              offset: Offset(
                  0, 0), // Desplazamiento de la sombra (horizontal, vertical)
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextFormField(
          style: AppTheme.tsComponents,
          initialValue: initialText,
          readOnly: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.5),
              borderRadius: BorderRadius.circular(20.0),
            ),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
