import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/images.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/style.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'components/about_buttons.dart';

class MobAboutScreen extends StatefulWidget {
  const MobAboutScreen({Key? key}) : super(key: key);

  @override
  _MobAboutScreenState createState() => _MobAboutScreenState();
}

class _MobAboutScreenState extends State<MobAboutScreen> with TickerProviderStateMixin{

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    _fadeInController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeInController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeInController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeInController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return VisibilityDetector(
      key: Key('about-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 25) {
          _scaleController.forward();
        }
      },
      child: Container(
        color: dark,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: appPadding * 2,vertical: appPadding * 3),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: primary, width: 5),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset(
                      myImage,
                      height: 400,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: appPadding * 2,),
            FadeTransition(
              opacity: _fadeInAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameText,
                    style: headTextStyle1,
                  ),
                  SizedBox(
                    height: appPadding / 2,
                  ),
                  Text(
                    desigText,
                    style: headTextStyle2,
                  ),
                  SizedBox(
                    height: appPadding / 2,
                  ),
                  Text(
                    aboutMeText,
                    style: regularTextStyle,
                  ),
                  SizedBox(
                    height: appPadding,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primary, width: 2)),
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            color: white.withOpacity(0.5),
                          ),
                          Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primary, width: 2)),
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            color: white.withOpacity(0.5),
                          ),
                          Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primary, width: 2)),
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            color: white.withOpacity(0.5),
                          ),
                          Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primary, width: 2)),
                          ),
                        ],
                      ),
                      SizedBox(width: appPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From: ',
                                style: headTextStyle4,
                              ),
                              Text(
                                fromText,
                                style: regularTextStyle2,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lives In: ',
                                style: headTextStyle4,
                              ),
                              Text(
                                livesInText,
                                style: regularTextStyle2,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Age: ',
                                style: headTextStyle4,
                              ),
                              Text(
                                ageText,
                                style: regularTextStyle2,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gender: ',
                                style: headTextStyle4,
                              ),
                              Text(
                                genderText,
                                style: regularTextStyle2,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: appPadding * 1.5,
                  ),
                  Row(
                    children: [
                      AboutButton(btnText: 'Hire Me', launchUrl: 'https://www.fiverr.com/share/DdwPDQ',)
                    ],
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
