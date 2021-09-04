import 'package:flutter/material.dart';
import 'package:portfolio/model/nav_item.dart';
import 'package:portfolio/screens/main/appbar/components/web_app_bar.dart';


class WebAppBarTransition extends StatefulWidget {
  const WebAppBarTransition({Key? key, required this.doChange, required this.animation, required this.navItems}) : super(key: key);

  final Animation<double> animation;
  final bool doChange;
  final List<NavItemData> navItems;

  @override
  _WebAppBarTransitionState createState() => _WebAppBarTransitionState();
}

class _WebAppBarTransitionState extends State<WebAppBarTransition> {

  @override
  Widget build(BuildContext context) {

    return widget.doChange ? Align(
      alignment: Alignment.topCenter,
      child: FadeTransition(
        opacity: widget.animation ,
        child: WebAppBar(isSmall: true, navItems: widget.navItems,),
      ),
    ) :WebAppBar(isSmall: false, navItems: widget.navItems,);
  }
}
