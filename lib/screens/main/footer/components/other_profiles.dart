import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/utils/url_launcher.dart';

class OtherProfiles extends StatefulWidget {
  const OtherProfiles({Key? key, required this.imageUrl, required this.launchUrl}) : super(key: key);

  final String imageUrl,launchUrl;

  @override
  _OtherProfilesState createState() => _OtherProfilesState();
}

class _OtherProfilesState extends State<OtherProfiles> {


  late bool isHovered = false;

  void _mouseEnter(bool hovering) {
    setState(() {
      isHovered = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: () => UrlLauncher.openLink(url: widget.launchUrl),
        child: SvgPicture.asset(
          widget.imageUrl,
          height: 25,
          width: 25,
          color: isHovered ? primary : white,
        ),
      ),
    );
  }
}
