import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/appColors.dart';
import 'package:google_fonts/google_fonts.dart';
class Button extends StatelessWidget {
  final String text;
  final double width,height;
  final void Function() onTap;
  const Button({super.key,required this.text,required this.width,required this.height,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: width,
        height: height,
       decoration: BoxDecoration(
         color: AppColors.primary,
         borderRadius: BorderRadius.circular(20),
       ),
        child: Center(child: Text(text,style: GoogleFonts.poppins(color: Colors.white,fontSize: 16),)),
      ),
    );
  }
}
