import 'package:flutter/material.dart';
import 'package:tthh_navidad/app_theme.dart';

class CustomAlertDialog extends StatelessWidget {
  final bool isError;
  final String title;
  final String message;

  const CustomAlertDialog(
      {super.key,
      required this.isError,
      required this.title,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white, // Fondo blanco del AlertDialog
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Row(
        children: [
          Icon(isError ? Icons.close_rounded : Icons.check_circle,
              color: isError
                  ? Colors.red
                  : Colors.green), // Cambia el color según el tipo de mensaje
          const SizedBox(width: 8),
          Text(title, style: AppTheme.tsTitle),
        ],
      ),
      content: Text(message, style: AppTheme.tsComponents),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Cierra el diálogo cuando se presiona el botón
          },
          child: Text(
            'Aceptar',
            style: AppTheme.tsTitle,
          ),
        ),
      ],
    );
  }
}
