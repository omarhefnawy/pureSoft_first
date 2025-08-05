import 'package:flutter/material.dart';
class LayoutButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  const LayoutButton({super.key,this.color=Colors.white,required this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Row(
        children: [
          Icon(icon),
          Text(text),
        ],
      )),
    );
  }
}
