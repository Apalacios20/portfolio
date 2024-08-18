import 'package:flutter/material.dart';

class ContactFormTextField extends StatelessWidget {
  final String label;
  final int minLines;
  final int? maxLines;
  const ContactFormTextField({
    required this.label,
    required this.minLines,
    required this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: minLines,
      maxLines: maxLines,
      style: TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow,
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
