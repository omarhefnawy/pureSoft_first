import 'package:flutter/material.dart';
class PageContent extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  PageContent({
    required this.title,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: height*.3, // يمكنك تعديل الارتفاع حسب الحاجة
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            content,
            style: TextStyle(fontSize: 18,color: Color(0xff78787C)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}