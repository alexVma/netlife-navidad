import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tthh_navidad/app_theme.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:tthh_navidad/src/widgets/custom_elevated_button.dart';
import 'package:tthh_navidad/src/widgets/footer.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/ui/widgets/custom_text_field.dart';

import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/use_cases/confirmation_use_case.dart';
import 'package:url_launcher/url_launcher.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  Widget separator = const SizedBox(height: 25);
  bool policyConfirm = false;
  bool? attend;

  String apellido = '';
  String ciudadEvento = '';
  String nombre = '';
  String celular = '';

  final TextEditingController _tecCedula = TextEditingController(text: '');
  final TextEditingController _tecPhone = TextEditingController(text: '');
  ConfirmationUseCase confirmationUseCase = ConfirmationUseCase();
  User? user;

  void getDataByCedula() async {
    user = await confirmationUseCase.getUserByIdentification(_tecCedula.text);
    setState(() {
      apellido = user!.apellido;
      nombre = user!.nombre;
      ciudadEvento = user!.ciudadEvento!;
      _tecPhone.text = user!.celular;
    });
  }

  @override
  void initState() {
    super.initState();
    _tecCedula.addListener(() {
      if (_tecCedula.text.length >= 10) {
        getDataByCedula();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width > 900 ? size.width / 5 : 300,
        child: Column(
          children: [
            separator,
            Text(
              'CONFIRMA TU ASISTENCIA',
              style: AppTheme.tsTitle,
              textAlign: TextAlign.center,
            ),
            separator,
            identificationSearcher(),
            separator,
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
            CustomTextField(
              label: 'Ciudad Evento',
              initialText: ciudadEvento,
            ),
            separator,
            getDropdownButtonFormField(),
            separator,
            phoneEditor(),
            separator,
            getRowPersonalData(),
            separator,
            getButton(context)
          ],
        ),
      ),
    );
  }

  Future<void> _showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // El usuario no puede cerrar el popup tocando fuera de él
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(), // Spinner dentro del popup
              SizedBox(height: 20),
              Text('Cargando...'), // Mensaje opcional de carga
            ],
          ),
        );
      },
    );
  }

  Widget identificationSearcher() {
    return Container(
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
        controller: _tecCedula,
        style: AppTheme.tsComponents,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          labelText: 'Digita tu Cédula',
          labelStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget phoneEditor() {
    return Container(
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
        controller: _tecPhone,
        style: AppTheme.tsComponents,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          labelText: 'Celular',
          labelStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget getButton(BuildContext context) {
    return CustomElevatedButton(
      width: double.maxFinite,
      onPressed: () async {
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

        if (user == null || user!.nombre == 'Identificacion No existe') {
          confAttend = null;
          isError = true;
          title = 'Error';
          desc = 'Digite correctamente su cédula\npara cargar su informacion';
        }
        if (_tecPhone.text.length != 10) {
          confAttend = null;
          isError = true;
          title = 'Error';
          desc = 'Por favor, ingrese un numero de celular valido';
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
        } else {
          if (confAttend && user != null) {
            _showLoadingDialog(context);
            bool response = await confirmationUseCase.saveUserConfirmation(
                user!.id, _tecPhone.text);
            Navigator.of(context).pop();
            if (response) {
              AwesomeDialog(
                context: context,
                width: 300,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: 'Info',
                desc:
                    'Gracias por confirmar tu asistencia\nEspera tu còdigo QR para el ingreso al evento',
                btnOkOnPress: () {},
              ).show();
            } else {
              AwesomeDialog(
                context: context,
                width: 300,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Info',
                desc: 'A ocurrido un problema',
                btnOkOnPress: () {},
              ).show();
            }
          }
        }
      },
      text: 'RESPONDER',
    );
  }

  Widget getDropdownButtonFormField() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2.5),
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
        fillColor: Colors.transparent.withOpacity(.25),
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
                      color: Colors.orangeAccent,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri url =
                            Uri.parse('https://www.netlife.ec/consentimiento/');
                        if (!await launchUrl(url,
                            webOnlyWindowName: '_blank')) {
                          throw Exception('Could not launch $url');
                        }
                      },
                  ),
                ]))),
      ],
    );
  }
}
