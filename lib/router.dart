import 'package:fluro/fluro.dart';
import 'package:tthh_navidad/src/comfirmacion_asistencia/ui/screens/confirmacion_page.dart';
import 'package:tthh_navidad/src/list/ui/table_view_all.dart';
import 'package:tthh_navidad/src/widgets/not_found_page.dart';

class RouterFluro {
  static final router = FluroRouter();
  static final Handler _confirmHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          ConfirmacionPage());

  static final Handler _viewAllHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => TableViewAll());

  static void setupRouter() {
    router.notFoundHandler =
        Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return const NotFoundPage();
    });

    router.define(
      'confirmacion',
      handler: _confirmHandler,
    );

    router.define(
      'listar',
      handler: _viewAllHandler,
    );
  }
}
