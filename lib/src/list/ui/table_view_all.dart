import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../app_config.dart';
import '../../comfirmacion_asistencia/domain/entities/user.dart';
import 'package:http/http.dart' as http;

class TableViewAll extends StatefulWidget {
  const TableViewAll({super.key});

  @override
  State<TableViewAll> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<TableViewAll> {
  late List<User> data = [];

  @override
  void initState() {
    getData();
  }

  getData() async {
    final url = '${AppConfig.BACKEND_URL}usuario/findAll';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);

        // Itera a través de la lista e imprime cada objeto JSON
        for (var item in jsonResponse) {
          data.add(User(
              id: item['id'],
              apellido: item['apellidos'],
              nombre: item['nombres'],
              celular: item['celular'] ?? '',
              ciudadEvento: item['ciudad_evento'] ?? '',
              asistire: item['confirmacion'] ?? false));

          setState(() {
            data.sort((a, b) => a.asistire == b.asistire
                ? 0
                : a.asistire!
                    ? -1
                    : 1);
          });
        }
      } else {
        throw Exception('Error al cargar el código QR');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Asistentes'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Apellido')),
            DataColumn(label: Text('Ciudad Evento')),
            DataColumn(label: Text('Asistire')),
            DataColumn(label: Text('Celular')),
          ],
          rows: data.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item.nombre)),
                DataCell(Text(item.apellido)),
                DataCell(Text(item.ciudadEvento!)),
                DataCell(Text((item.asistire! ? 'Si' : 'No'))),
                DataCell(Text(item.celular)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
