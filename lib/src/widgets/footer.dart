import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageSize = constraints.maxWidth /
            3; // Ajusta el tamaño de la imagen según ancho de la pantalla
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('resources/img/logo_netlife.png',
                        width: imageSize),
                    Image.asset('resources/img/paco_arriba.png',
                        width: imageSize / 2),
                    Image.asset('resources/img/ecuanet.png', width: imageSize),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
