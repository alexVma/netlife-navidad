import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int option = 0; // Texto inicial en la pantalla principal
  Widget _selectedOption=Center(child: Text('hola'),);

  void _updateSelectedOption(int option) {
    setState(() {
      switch(option){ // Cambia el texto en la pantalla principal
        case 0:
          _selectedOption=Center(child: Text('hola'),);
        break;
        case 1:
          _selectedOption=Center(child: Text('opcion 1'),);
          break;
        case 2:
          _selectedOption=Center(child: Text('opcion 2'),);
          break;
        case 3:
          _selectedOption=Center(child: Text('opcion 3'),);
          break;
      }
      Navigator.pop(context); // Cierra el menú lateral después de seleccionar una opción
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Lateral'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú Lateral',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () => _updateSelectedOption(0),
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () => _updateSelectedOption(1),
            ),
            ListTile(
              title: Text('Acerca de'),
              onTap: () => _updateSelectedOption(2),
            ),
          ],
        ),
      ),
      body: Center(
        child:
          _selectedOption
      ),
    );
  }
}
