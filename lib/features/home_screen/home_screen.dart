import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widgets/category_card.dart';
import 'package:evently/core/widgets/custom_elveted_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/widgets/custom_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);

    return DefaultTabController(
      length: 7,
      child: Column(
        spacing: 10,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: size.size.height * 0.29,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: SafeArea(
              child: Column(spacing: 10, children: [
                Row(
                  spacing: 10,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Welcome Back ✨',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.backgroundWhite,
                          ),
                        ),
                        Text(
                          'John Safwat',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.backgroundWhite,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/Sun.svg',
                    ),
                    CustomElevatedButton(
                      onPressed: () {},
                      backGroundColor: AppColors.backgroundWhite,
                      title: 'EN',
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.backgroundWhite,
                    ),
                    Text(
                      'Cairo , Egypt',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.backgroundWhite),
                    )
                  ],
                ),
                Expanded(
                  child: TabBar(
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        CustomTabBar(
                          icon: AppAssets.allLogo,
                          text: 'All',
                          isSelected: selectedIndex == 0,
                        ),
                        CustomTabBar(
                          icon: AppAssets.bikeLogo,
                          text: 'Sports',
                          isSelected: selectedIndex == 1,
                        ),
                        CustomTabBar(
                          icon: AppAssets.cakeLogo,
                          text: 'Birthday',
                          isSelected: selectedIndex == 2,
                        ),
                        CustomTabBar(
                          icon: AppAssets.bookLogo,
                          text: 'Meeting',
                          isSelected: selectedIndex == 3,
                        ),
                        CustomTabBar(
                          icon: AppAssets.eatingLogo,
                          text: 'Eating',
                          isSelected: selectedIndex == 4,
                        ),
                        CustomTabBar(
                          icon: AppAssets.eatingLogo,
                          text: 'Reading',
                          isSelected: selectedIndex == 5,
                        ),
                        CustomTabBar(
                          icon: AppAssets.eatingLogo,
                          text: 'Gaming',
                          isSelected: selectedIndex == 6,
                        ),
                      ]),
                ),
              ]),
            ),
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return CategoryCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
