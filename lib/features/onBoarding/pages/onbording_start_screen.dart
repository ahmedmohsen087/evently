import 'package:evently/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/boarding_item.dart';

class OnboardingStartScreen extends StatelessWidget {
  static const routeName = '/onboarding-start-screen';

  const OnboardingStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OnboardingModel(
              logo: AppAssets.appBarLogo,
              image: AppAssets.onBoardingStart,
              title: 'Personalize Your Experience',
              body:
                  'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
            ),
            Row(
              children: [
                Text(
                  'Language',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Flag(
                          Flags.egypt,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flag(
                        Flags.united_states_of_america,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Theme',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.onboardingScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Let’s Start',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
