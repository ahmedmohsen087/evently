import 'package:evently/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/boarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = 'onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardController = PageController();
  List<OnboardingModel> boarding = [
    OnboardingModel(
        logo: AppAssets.appBarLogo,
        image: AppAssets.onBoarding1,
        title: 'Find Events That Inspire You',
        body:
            'Dive into a world of events crafted to fit your unique interests. Whether you are into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'),
    OnboardingModel(
        logo: AppAssets.appBarLogo,
        image: AppAssets.onBoarding2,
        title: 'Effortless Event Planning',
        body:
            'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'),
    OnboardingModel(
        logo: AppAssets.appBarLogo,
        image: AppAssets.onBoarding3,
        title: 'Connect with Friends & Share Moments',
        body:
            'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                itemBuilder: (context, index) => (boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      if (isLast) {
                        boardController.previousPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.bounceOut);
                      } else {
                        boardController.previousPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.bounceOut);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: AppColors.gray,
                      activeDotColor: AppColors.primaryColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (isLast) {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.signIn);
                      } else {
                        boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.bounceOut);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
