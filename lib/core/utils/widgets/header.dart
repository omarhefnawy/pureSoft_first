import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../config/appColors.dart';
import 'custom_text.dart';
class Header extends StatelessWidget {
  final String text;
  final String desc;
  const Header({super.key,required this.text,required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Center(child: CustomText(text: text,color: AppColors.primary,size: 25,)),
    Gap(10),
    CustomText(text: desc,size: 25,),
    ],);
  }
}
