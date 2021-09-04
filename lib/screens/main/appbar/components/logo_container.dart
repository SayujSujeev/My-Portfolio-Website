import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/images.dart';
import 'package:portfolio/constants/padding.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Row(
        children: [

          // Image.asset(
          //   logoUrl,
          //   height: 45,
          //   width: 45,
          // ),
          // SizedBox(
          //   width: appPadding / 2,
          // ),

          Text(
            'Sayuj Sujeev',
            style: GoogleFonts.allura(
              color: primary,
              fontSize: 36,
              fontStyle: FontStyle.italic,
            ),
          ),


        ],
      ),

    );
  }
}
