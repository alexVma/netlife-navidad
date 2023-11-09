class User {
  String id;
  String apellido;
  String nombre;
  String celular;
  String? ciudadEvento = '';
  bool? asistire;

  User(
      {required this.id,
      required this.apellido,
      required this.nombre,
      required this.celular,
      this.ciudadEvento,
      this.asistire});
}
