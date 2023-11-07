import 'package:tthh_navidad/src/comfirmacion_asistencia/domain/entities/user.dart';

import '../../data/data_sources/mock_data_source.dart';
import '../../data/data_sources/remote_data_source.dart';

class ConfirmationUseCase {
  User getUser(String userId) {
    MockDataSource mds = MockDataSource();
    return mds.getUser(userId);
  }

  Future<User> getUserByIdentification(String identification){
    RemoteDataSource rds = RemoteDataSource();
    return rds.getUserByIdentification(identification);
  }
}
