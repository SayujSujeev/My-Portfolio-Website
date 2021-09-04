import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/style.dart';

class NavItem extends StatefulWidget {
  NavItem({
    required this.title,
    this.titleColor = white,
    this.isSelected = false,
    this.isMobile = false,
    this.titleStyle,
    this.onTap,
  });

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final bool isSelected;
  final bool isMobile;
  final GestureTapCallback? onTap;

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with SingleTickerProviderStateMixin {
  bool _hovering = false;

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: appBarTxtSyl,
            ),
            SizedBox(
              height: appPadding / 3,
            ),
            widget.isSelected
                ? Container(
                    width: 40,
                    height: 2,
                    color: primary,
                  )
                : AnimatedContainer(
                    width: _hovering ? 40 : 0,
                    height: 2,
                    color: primary,
                    curve: Curves.linearToEaseOut,
                    duration: Duration(milliseconds: 500),
                  )
          ],
        ),
      ),
    );
  }
}
