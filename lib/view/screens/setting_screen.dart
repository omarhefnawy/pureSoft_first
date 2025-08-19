import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/app_responsive.dart';
import 'package:fruits_task/core/utils/widgets/button.dart';
import 'package:fruits_task/core/utils/widgets/custom_text.dart';
import 'package:fruits_task/models/setting_content.dart';
import 'package:gap/gap.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<SettingContent> content = [
    SettingContent(
      prefix: Icons.person,
      text: "profiles",
      suffix: Icons.arrow_back_outlined,
    ),
    SettingContent(
      prefix: Icons.favorite,
      text: "favourite",
      suffix: Icons.arrow_back_outlined,
    ),
    SettingContent(
      prefix: Icons.language,
      text: "languages",
      suffix: Icons.arrow_back_outlined,
    ),
    SettingContent(
      prefix: Icons.info,
      text: "about",
      suffix: Icons.arrow_back_outlined,
    ),
    SettingContent(
      prefix: Icons.support,
      text: "support",
      suffix: Icons.arrow_back_outlined,
    ),
    SettingContent(
      prefix: Icons.settings,
      text: "settings",
      suffix: Icons.arrow_back_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double w = AppResponsive.width(context);
    double h = AppResponsive.bodyHeight(context);

    return OrientationBuilder(
      builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isLandscape
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person, size: 30),
                        radius: 30,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Welcome, Fruit Market",
                            size: 22,
                            color: Colors.black,
                          ),
                          const Gap(10),
                          Button(
                            text: "login",
                            width: 150,
                            height: 45,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person, size: 30),
                        radius: 30,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      const Gap(10),
                      CustomText(
                        text: "Welcome, Fruit Market",
                        size: 24,
                        color: Colors.black,
                      ),
                      const Gap(20),
                      Button(text: "login", width: w, height: 51, onTap: () {}),
                    ],
                  ),
              const Gap(10),
              Expanded(
                child: ListView.builder(
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    final data = content[index];
                    return ListTile(
                      leading: Icon(data.prefix),
                      title: Text(data.text),
                      trailing: Icon(data.suffix),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
