import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';

abstract class ConfirmationDS {
  User getUser(String userId);
  Future<void> saveAnswer(bool attend);
}
