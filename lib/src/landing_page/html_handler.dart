import 'package:flutter/material.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/ui/screens/confirmation.dart';
import 'package:tthh_navidad/src/landing_page/ui/widgets/celebration_text_widget.dart';
import 'package:tthh_navidad/src/landing_page/ui/widgets/custom_card.dart';
import 'package:tthh_navidad/src/widgets/footer.dart';

import '../../app_theme.dart';

class HTMLWidget extends StatefulWidget {
  const HTMLWidget({super.key});

  @override
  createState() => _HTMLWidgetState();
}

class _HTMLWidgetState extends State<HTMLWidget> {
  @override
  void initState() {
    super.initState();
  }

  bool isDesktop = true;
  @override
  Widget build(BuildContext context) {
    /*SizedBox(
          width: 100, // Define el ancho del iframe
          height: 700, // Define la altura del iframe
          child: AspectRatio(
            aspectRatio: 1,
            child: HtmlElementView(viewType: 'hello-html'),
          ),
        ),*/
    double widthScreen = MediaQuery.of(context).size.width;
    isDesktop = widthScreen > 600;

    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Image.asset(
                //header
                isDesktop
                    ? 'resources/html/recursos/img/banner_principal.png'
                    : 'resources/html/recursos/img/BannerResponsive.png',
                width: widthScreen),
            body(isDesktop, widthScreen), //body
            SizedBox(
                // footer
                width: double.maxFinite,
                height: isDesktop ? 200 : 80,
                child: const Footer())
          ],
        ));
  }

  Widget body(bool isDesktop, double widthScreen) {
    return isDesktop
        ? Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                  width: widthScreen / 2 - 10, child: staticTexts(widthScreen)),
              SizedBox(
                  width: widthScreen / 2 - 20,
                  child: const Confirmation(id: 'test1'))
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              staticTexts(widthScreen),
              const Confirmation(id: 'test1')
            ],
          );
  }

  Widget staticTexts(double widthScreen) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CelebrationTextWidget(
            isDesktop: isDesktop,
          ),
          CustomCard(),
          Container(
              margin: const EdgeInsets.only(top: 20),
              width: widthScreen,
              child: Text(
                '*Invitacion exclusiva\ne intransferible',
                style: AppTheme.tsComponents,
                textAlign: TextAlign.center,
              )),
        ]);
  }
}
