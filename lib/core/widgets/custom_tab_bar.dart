import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTabBar extends StatefulWidget {
  final String icon;
  final String text;
  final bool isSelected;
  final bool isHomeTab;

  const CustomTabBar({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    this.isHomeTab = true,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: widget.isSelected
              ? (widget.isHomeTab ? AppColors.white : AppColors.primaryColor)
              : (widget.isHomeTab ? AppColors.primaryColor : AppColors.white),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color:
                  widget.isHomeTab ? AppColors.cardCyan : AppColors.primaryColor
              //AppColors.cardCyan ,
              )),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(widget.icon),
            color: widget.isSelected
                ? (widget.isHomeTab ? AppColors.primaryColor : AppColors.white)
                : (widget.isHomeTab ? AppColors.white : AppColors.primaryColor),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: widget.isSelected
                  ? (widget.isHomeTab
                      ? AppColors.primaryColor
                      : AppColors.white)
                  : (widget.isHomeTab
                      ? AppColors.white
                      : AppColors.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
