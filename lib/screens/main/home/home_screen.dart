import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/images.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: 900,
          width: double.infinity,
          child: Image.asset(bgImageOne,height: 900,width: double.infinity,fit: BoxFit.cover,),
        ),
        Container(
          height: 900,
          width: double.infinity,
          color: dark.withOpacity(0.9),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(headText,style: mainTextStyle,textAlign: TextAlign.center,),

                SizedBox(height: appPadding * 2,),

                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      subText1,
                      textStyle: subTextStyle,
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      subText2,
                      textStyle: subTextStyle,
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      subText3,
                      textStyle: subTextStyle,
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      subText4,
                      textStyle: subTextStyle,
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],

                  repeatForever: true,
                  pause: const Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: false,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
