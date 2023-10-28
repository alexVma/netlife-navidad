import 'package:flutter/cupertino.dart';

class Confirmation extends StatefulWidget {
  Confirmation({super.key, required this.id});

  final String id;

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFE306),
      child: Text(widget.id),
    );
  }
}
