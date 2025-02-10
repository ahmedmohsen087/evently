import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Container(
      width: size.size.width * 0.9,
      height: size.size.height * 0.26,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(AppAssets.cardBirthday), fit: BoxFit.fill)),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Text(
              '12 \n nov',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Meeting for Updating The Development Method ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
