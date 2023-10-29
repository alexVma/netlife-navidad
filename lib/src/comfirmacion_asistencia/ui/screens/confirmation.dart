import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tthh_navidad/app_theme.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:tthh_navidad/src/widgets/custom_elevated_button.dart';
import 'package:tthh_navidad/src/widgets/footer.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/ui/widgets/custom_text_field.dart';

import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/use_cases/confirmation_use_case.dart';

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

  String apellido = '';
  String nombre = '';
  String celular = '';

  @override
  void initState() {
    super.initState();
    User user = ConfirmationUseCase().getUser(widget.id);
    apellido = user.apellido;
    nombre = user.nombre;
    celular = user.celular;
  }

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
                        CustomTextField(
                          label: 'Nombre',
                          initialText: nombre,
                        ),
                        separator,
                        CustomTextField(
                          label: 'Apellido',
                          initialText: apellido,
                        ),
                        separator,
                        getDropdownButtonFormField(),
                        separator,
                        CustomTextField(
                          label: 'Celular',
                          initialText: celular,
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
      onPressed: () {
        bool isError = true;
        String title = '';
        String desc = '';
        bool? confAttend;

        if (attend == null) {
          isError = true;
          title = 'Error';
          desc = 'Asistiras a la celebración ?\n'
              'Elige una opcion.  ';
        } else if (attend!) {
          if (!policyConfirm) {
            isError = true;
            title = 'Error';
            desc = 'Por favor, acepta las políticas de privacidad';
          } else {
            confAttend = true;
          }
        } else {
          confAttend = false;
          isError = false;
          title = 'Información';
          desc = 'Lamentamos que no puedas acompañarnos, nos harás falta!';
        }

        if (confAttend == null) {
          AwesomeDialog(
            context: context,
            width: 300,
            dialogType: isError ? DialogType.error : DialogType.info,
            animType: AnimType.rightSlide,
            title: title,
            desc: desc,
            btnOkOnPress: () {},
          ).show();
        } else {}
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
                        // print('hola');
                      },
                  ),
                ]))),
      ],
    );
  }
}
