import 'dart:convert';

import 'package:tthh_navidad/src/comfirmacion_asistencia/data/data_sources/confirmation_ds.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';
import 'package:http/http.dart' as http;


import 'package:tthh_navidad/app_config.dart';

class RemoteDataSource implements ConfirmationDS {
  @override
  User getUser(String userId) {
    Map<String, User> mockUsers = {
      'test1': User(nombre: 'Alex', apellido: 'Minga', celular: '0992628036'),
      'test2':
      User(nombre: 'Nombre', apellido: 'Apellido', celular: '0992628036'),
    };
    return mockUsers[userId] == null
        ? User(nombre: '', apellido: '', celular: '')
        : mockUsers[userId]!;
  }

  @override
  Future<void> saveAnswer(bool attend) {
    throw UnimplementedError();
  }

  @override
  Future<User> getUserByIdentification(String identification) async {
    final url = '${AppConfig.BACKEND_URL}usuario/findByCedula/{cedula}?cedula=$identification';
    User user=User(apellido: 'vuelva a intentar', nombre: 'error', celular: '');
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        if(response.body.length>1){
          Map<String, dynamic> jsonResponse = json.decode(response.body);
          user=User(apellido: jsonResponse['apellidos'], nombre: jsonResponse['nombres'], celular: '');
        }
      } else {
        throw Exception('Error al cargar el código QR');
      }
    } catch (error) {
      print('Error: $error');
    }
    return user;
  }

}