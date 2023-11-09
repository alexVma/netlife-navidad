import 'package:flutter/material.dart';

import 'package:tthh_navidad/app_theme.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/ui/screens/confirmation.dart';

class ConfirmacionPage extends StatelessWidget {
  final TextEditingController tec = TextEditingController();
  ConfirmacionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Confirmation(),
    );
  }
}
