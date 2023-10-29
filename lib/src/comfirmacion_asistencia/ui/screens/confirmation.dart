import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tthh_navidad/app_theme.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/footer.dart';
import '../widgets/custom_text_field.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key, required this.id});

  final String id;

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  Widget separator = const SizedBox(height: 25);
  bool policyConfirm = false;
  bool? attend;

  @override
  Widget build(BuildContext context) {
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

  void formValidator() {}

  Widget getButton() {
    return CustomElevatedButton(
      width: double.maxFinite,
      onPressed: (){

      },
      text: 'ASISTIRÉ',
    );
  }

  Widget getDropdownButtonFormField() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.orangeAccent, width: 2.5),
      borderRadius: BorderRadius.circular(20.0),
    );

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
        attend = value == 'Si';
      },
      dropdownColor: Colors.orange[200],
      decoration: InputDecoration(
        labelText: 'Asistire',
        labelStyle: AppTheme.tsComponents,
        filled: true,
        enabledBorder: outlineInputBorder,
        fillColor: Colors.orangeAccent.withOpacity(.25),
        focusedBorder: outlineInputBorder,
      ),
      style: AppTheme.tsComponents, // Color del texto seleccionado en blanco
    );
  }

  Widget getRowPersonalData() {
    return Row(
      children: [
        Checkbox(
          value: policyConfirm,
          onChanged: (value) {
            setState(() {
              policyConfirm = value!;
            });
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
