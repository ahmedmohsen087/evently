import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/event_category.dart';

class TabWidget extends StatelessWidget {
  final EventsCategory eventCategory;
  final bool isSelected;

  const TabWidget({
    super.key,
    required this.eventCategory,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : AppColors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Row(
        children: [
          Icon(
            eventCategory.eventCategoryIcon,
            color: isSelected ? AppColors.white : AppColors.primaryColor,
          ),
          SizedBox(width: 5),
          Text(
            eventCategory.eventCategoryName,
            style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected ? AppColors.white : AppColors.primaryColor),
          )
        ],
      ),
    );
  }
}
