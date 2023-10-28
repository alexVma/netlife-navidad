import 'package:fluro/fluro.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/ui/screens/confirmacion.dart';
import 'package:tthh_navidad/src/widgets/not_found_page.dart';

class RouterFluro {
  static final router = FluroRouter();
  static final Handler _confirmHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          Confirmation(id: params['id'][0]));

  static void setupRouter() {
    router.notFoundHandler =
        Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return const NotFoundPage();
    });

    router.define(
      'confirmacion/:id',
      handler: _confirmHandler,
    );
  }
}
