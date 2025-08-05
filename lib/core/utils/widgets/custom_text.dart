import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomText extends StatelessWidget {
  final String text;
  final int max;
  final TextOverflow overFlow;
  final double size;
  final Color color;
  const CustomText({super.key,required this.text,this.size=25,this.overFlow=TextOverflow.ellipsis,this.color=Colors.black,this.max=1});

  @override
  Widget build(BuildContext context) {
    return Text(text,maxLines: max,overflow: overFlow,style: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: color,
    ),);
  }
}
