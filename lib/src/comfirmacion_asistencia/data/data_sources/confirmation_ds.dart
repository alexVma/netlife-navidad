import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';

abstract class ConfirmationDS {
  User getUser(String userId);
  Future<void> saveAnswer(bool attend);
  Future<User> getUserByIdentification(String identification);
  Future<bool> saveUserConfirmation(String userId, String celular,bool attend);
}
