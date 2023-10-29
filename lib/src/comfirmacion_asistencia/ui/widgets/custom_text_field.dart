import 'package:flutter/material.dart';

import 'package:tthh_navidad/AppTheme.dart';

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
          boxShadow: [
            BoxShadow(
              color: Colors.orangeAccent
                  .withOpacity(0.25), // Color de la sombra naranja
              spreadRadius: 0, // Extensión de la sombra
              blurRadius: .25, // Difuminado de la sombra
              offset: const Offset(
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
              borderSide:
                  const BorderSide(color: Colors.orangeAccent, width: 2.5),
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
