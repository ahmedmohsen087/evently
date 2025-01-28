import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class OnboardingModel extends StatelessWidget {
  String logo;
  String image;
  String title;
  String body;

  OnboardingModel({
    super.key,
    required this.logo,
    required this.image,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                logo,
              ),
              width: size.width * .40,
            ),
          ),
          Image(
            image: AssetImage(image),
            height: size.height * .40,
          ),
          Text(
            title,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            body,
            style: TextStyle(
                color: AppColors.gray,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
