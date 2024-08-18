import 'package:flutter/material.dart';

class SkillNullBtn extends StatelessWidget {
  final String text;
  const SkillNullBtn({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.7),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
    );
  }
}
