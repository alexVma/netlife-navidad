import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';

import '../../data/data_sources/mock_data_source.dart';
import '../../data/data_sources/remote_data_source.dart';

class ConfirmationUseCase {
  RemoteDataSource rds = RemoteDataSource();
  User getUser(String userId) {
    MockDataSource mds = MockDataSource();
    return mds.getUser(userId);
  }

  Future<User> getUserByIdentification(String identification) {
    return rds.getUserByIdentification(identification);
  }

  Future<bool> saveUserConfirmation(String id, String phone,bool attend) {
    return rds.saveUserConfirmation(id, phone,attend);
  }
}
