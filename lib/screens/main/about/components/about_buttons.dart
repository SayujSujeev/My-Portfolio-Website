import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/style.dart';
import 'package:portfolio/utils/url_launcher.dart';

class AboutButton extends StatefulWidget {
  const AboutButton({Key? key, required this.btnText, required this.launchUrl}) : super(key: key);
  
  final String btnText,launchUrl;

  @override
  _AboutButtonState createState() => _AboutButtonState();
}

class _AboutButtonState extends State<AboutButton> {

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

        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: appPadding,
            vertical: appPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 2,color: primary,),
            borderRadius: BorderRadius.circular(5),
            color: isHovered ? primary : Colors.transparent,
          ),
          child: Center(
            child: Text(widget.btnText,style: isHovered ? headTextStyle4 : headTextStyle4,),
          ),
        ),
      ),
    );
  }
}
