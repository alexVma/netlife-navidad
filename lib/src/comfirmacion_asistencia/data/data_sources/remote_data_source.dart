import 'dart:convert';

import 'package:tthh_navidad/src/comfirmacion_asistencia/data/data_sources/confirmation_ds.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';
import 'package:http/http.dart' as http;


import 'package:tthh_navidad/app_config.dart';

class RemoteDataSource implements ConfirmationDS {
  @override
  User getUser(String userId) {
    Map<String, User> mockUsers = {
      'test1': User(id:'',nombre: 'Alex', apellido: 'Minga', celular: '0992628036'),
      'test2':
      User(id:'',nombre: 'Nombre', apellido: 'Apellido', celular: '0992628036'),
    };
    return mockUsers[userId] == null
        ? User(id:'',nombre: '', apellido: '', celular: '')
        : mockUsers[userId]!;
  }

  @override
  Future<void> saveAnswer(bool attend) {
    throw UnimplementedError();
  }

  @override
  Future<User> getUserByIdentification(String identification) async {
    final url = '${AppConfig.BACKEND_URL}usuario/findByCedula/{cedula}?cedula=$identification';
    User user=User(id:'0',apellido: 'vuelva a intentar', nombre: 'error', celular: '');
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        if(response.body.length>1){
          Map<String, dynamic> jsonResponse = json.decode(response.body);
          print(response.body);
          user=User(id:jsonResponse['id'],apellido: jsonResponse['apellidos'],
              nombre: jsonResponse['nombres'],
              celular: jsonResponse['celular'] ?? '',
              ciudadEvento: jsonResponse['ciudad_evento'] ?? '');
        }
      } else {
        throw Exception('Error al cargar el código QR');
      }
    } catch (error) {
      print('Error: $error');
    }
    return user;
  }

  @override
  Future<bool> saveUserConfirmation(String userId, String celular) async {
    //http://netlifeaccesstestqa11.netlife.net.ec/api/usuario/confirmacion/{id}/{celular}?id=qe&celular=qew
    print('id=$userId&celular=$celular');
    final url = '${AppConfig.BACKEND_URL}usuario/confirmacion/{id}/{celular}?id=$userId&celular=$celular';
    try {
      final response = await http.put(Uri.parse(url));
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

}