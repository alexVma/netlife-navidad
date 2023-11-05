import 'package:flutter/material.dart';
import 'package:tthh_navidad/app_theme.dart';

class CelebrationTextWidget extends StatelessWidget {
  final bool isDesktop;

  CelebrationTextWidget({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    TextStyle tsYellow = TextStyle(
      fontSize: isDesktop ? 50 : 40,
      color: Colors.yellow,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'CELEBRAREMOS EN\nDICIEMBRE NUESTRO',
          style: AppTheme.tsTitle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 80,
          width: double.maxFinite,
          child: Center(
            child: Container(
              width: isDesktop ? 388 : 320,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 1,
                    left: 1,
                    child: Text('ANIVERSARIO 13', style: tsYellow),
                  ),
                  Positioned(
                    top: -1,
                    left: -1,
                    child: Text('ANIVERSARIO 13', style: tsYellow),
                  ),
                  Positioned(
                    top: 1,
                    left: -1,
                    child: Text('ANIVERSARIO 13', style: tsYellow),
                  ),
                  Positioned(
                    top: -1,
                    left: 1,
                    child: Text('ANIVERSARIO 13', style: tsYellow),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Text(
                      'ANIVERSARIO 13',
                      style: tsYellow.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
