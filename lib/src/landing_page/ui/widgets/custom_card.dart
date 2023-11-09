import 'package:flutter/material.dart';
import 'package:tthh_navidad/app_theme.dart';

class CustomCard extends StatelessWidget {
  CustomCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.yellow
                    .withOpacity(0.25), // Color de la sombra naranja
                spreadRadius: 4, // Extensión de la sombra
                blurRadius: 5, // Difuminado de la sombra
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.white, width: 2)),
            shadowColor: Colors.yellow,
            elevation: 5,
            color: Colors.black,
            child: Container(
              width: 400,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('CUENCA ',
                      style: AppTheme.tsTitle
                          .copyWith(fontSize: AppTheme.tsTitle.fontSize! - 3)),
                  Text('GUAYAQUIL',
                      style: AppTheme.tsTitle
                          .copyWith(fontSize: AppTheme.tsTitle.fontSize! - 3)),
                  Text('QUITO',
                      style: AppTheme.tsTitle
                          .copyWith(fontSize: AppTheme.tsTitle.fontSize! - 3)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
