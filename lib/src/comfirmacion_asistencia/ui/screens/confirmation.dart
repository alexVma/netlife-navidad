import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tthh_navidad/AppTheme.dart';

import '../../../widgets/footer.dart';
import '../widgets/custom_text_field.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key, required this.id});

  final String id;

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(20.0),
  );

  @override
  Widget build(BuildContext context) {
    Widget separator = const SizedBox(height: 25);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const Footer(),
            Center(
              child: SizedBox(
                width: size.width > 900 ? size.width / 3 : 300,
                child: ListView(
                  children: [
                    separator,
                    separator,
                    Text(
                      'CONFIRMA TU ASISTENCIA',
                      style: AppTheme.tsTitle,
                      textAlign: TextAlign.center,
                    ),
                    separator,
                    Column(
                      children: [
                        const CustomTextField(
                          label: 'Nombre',
                          initialText: 'Alex V.',
                        ),
                        separator,
                        const CustomTextField(
                          label: 'Apellido',
                          initialText: 'Minga',
                        ),
                        separator,
                        getDropdownButtonFormField(),
                        separator,
                        const CustomTextField(
                          label: 'Celular',
                          initialText: '0992628036',
                        ),
                        separator,
                        getRowPersonalData(),
                        separator,
                        getButton()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget getButton() {
    return ElevatedButton(
      onPressed: () {
        print('Asistiré');
      },
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.orangeAccent.withOpacity(1),
        backgroundColor: Colors.orangeAccent,
        elevation: 5, // Altura de la sombra
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.orangeAccent[700]!, width: 3.5),
        ),
        minimumSize: const Size(double.infinity, 60),
      ),
      child: Text('Asistiré', style: AppTheme.tsTitle),
    );
  }

  Widget getDropdownButtonFormField() {
    return DropdownButtonFormField<String>(
      items: ['Si', 'No']
          .map((label) => DropdownMenuItem(
                value: label,
                child: Text(
                  label,
                  style: AppTheme.tsComponents, // Texto en color blanco
                ),
              ))
          .toList(),
      onChanged: (value) {
        // Puedes manejar el valor seleccionado aquí
      },
      dropdownColor: Colors.orange[200],
      decoration: InputDecoration(
        labelText: 'Asistire',
        labelStyle: AppTheme.tsComponents,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 2.5),
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: Colors.orangeAccent.withOpacity(.25),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent, width: 2.5),
          borderRadius: BorderRadius.circular(20),
          // Borde en color naranja
        ),
      ),
      style: AppTheme.tsComponents, // Color del texto seleccionado en blanco
    );
  }

  Widget getRowPersonalData() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {
            // Puedes manejar el estado del checkbox aquí
          },
        ),
        const SizedBox(width: 10),
        Expanded(
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text:
                        'Acepto contacto por canales digitales según Política de Tratamiento de ',
                    style: AppTheme.tsComponents,
                  ),
                  TextSpan(
                    text: 'datos personales',
                    style: AppTheme.tsComponents.copyWith(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('hola');
                      },
                  ),
                ]))),
      ],
    );
  }
}
