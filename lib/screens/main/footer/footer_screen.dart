import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/style.dart';
import 'package:portfolio/screens/main/footer/components/other_profiles.dart';
import 'package:portfolio/utils/url_launcher.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark,
      padding: EdgeInsets.symmetric(vertical: appPadding * 3),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            nameText,
            style: headTextStyleMini,
          ),
          SizedBox(
            height: appPadding,
          ),
          Text(
            placeText,
            style: headTextStyle3,
          ),
          SizedBox(
            height: appPadding / 1.5,
          ),
          Text(
            emailText,
            style: headTextStyle6,
          ),
          SizedBox(
            height: appPadding * 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OtherProfiles(
                imageUrl: 'assets/icons/github.svg',
                launchUrl: gitHubUrl,
              ),
              SizedBox(width: appPadding),
              OtherProfiles(
                imageUrl: 'assets/icons/Linkedin.svg',
                launchUrl: linkedInUrl,
              ),

              SizedBox(width: appPadding),
              OtherProfiles(
                imageUrl: 'assets/icons/Instagram.svg',
                launchUrl: instagramUrl,
              ),
              SizedBox(width: appPadding),
              OtherProfiles(
                imageUrl: 'assets/icons/Youtube.svg',
                launchUrl: youTubeUrl,
              ),
              SizedBox(width: appPadding),
              OtherProfiles(
                imageUrl: 'assets/icons/Dribbble.svg',
                launchUrl: dribbleUrl,
              ),
              SizedBox(width: appPadding),
              OtherProfiles(
                imageUrl: 'assets/icons/Behance.svg',
                launchUrl: behanceUrl,
              ),
              SizedBox(width: appPadding),
              OtherProfiles(
                imageUrl: 'assets/icons/Facebook.svg',
                launchUrl: facebookUrl,
              ),
              SizedBox(width: appPadding),
              OtherProfiles(
                imageUrl: 'assets/icons/Twitter.svg',
                launchUrl: twitterUrl,
              ),
            ],
          ),
          SizedBox(
            height: appPadding * 3,
          ),
          Text(
            '© All rights reserved Designed by $nameText',
            style: regularTextStyle,
          ),
        ],
      ),
    );
  }
}
