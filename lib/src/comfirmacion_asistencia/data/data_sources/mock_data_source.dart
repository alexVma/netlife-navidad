import 'package:tthh_navidad/src/comfirmacion_asistencia/data/data_sources/confirmation_ds.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';

class MockDataSource implements ConfirmationDS {
  @override
  User getUser(String userId) {
    Map<String, User> mockUsers = {
      'test1': User(
          id: '1', nombre: 'Alex', apellido: 'Minga', celular: '0992628036'),
      'test2': User(
          id: '2',
          nombre: 'Nombre',
          apellido: 'Apellido',
          celular: '0992628036'),
    };
    return mockUsers[userId] == null
        ? User(id: '0', nombre: '', apellido: '', celular: '')
        : mockUsers[userId]!;
  }

  @override
  Future<void> saveAnswer(bool attend) {
    throw UnimplementedError();
  }

  @override
  Future<User> getUserByIdentification(String identification) {
    // TODO: implement getUserByIdentification
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUserConfirmation(String userId, String celular) {
    // TODO: implement saveUserConfirmation
    throw UnimplementedError();
  }
}
