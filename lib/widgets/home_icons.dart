import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeIcons extends StatelessWidget {
  final String imageFileSvg;
  const HomeIcons({
    required this.imageFileSvg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.orange.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(6, 6),
          ),
          BoxShadow(
            color: Colors.yellow.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(9, 9),
          ),
          BoxShadow(
            color: Colors.green.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(12, 12),
          ),
          BoxShadow(
            color: Colors.blue.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(15, 15),
          ),
          BoxShadow(
            color: Colors.indigo.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(18, 18),
          ),
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(21, 21),
          ),
        ],
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.red,
        //     Colors.orange,
        //     Colors.yellow,
        //     Colors.green,
        //     Colors.blue,
        //     Colors.indigo,
        //     Colors.deepPurple,
        //   ],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
      ),
      child: Center(
        child: SvgPicture.asset('assets/$imageFileSvg.svg'),
      ),
    );
  }
}
