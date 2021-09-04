import 'package:flutter/material.dart';
import 'package:portfolio/screens/main/appbar/components/mob_app_bar.dart';

class MobAppBarTransition extends StatefulWidget {
  const MobAppBarTransition({Key? key, required this.doChange, required this.animation, required this.scaffoldKey}) : super(key: key);

  final Animation<double> animation;
  final bool doChange;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _MobAppBarTransitionState createState() => _MobAppBarTransitionState();
}

class _MobAppBarTransitionState extends State<MobAppBarTransition> {

  @override
  Widget build(BuildContext context) {

    return widget.doChange ? Align(
      alignment: Alignment.topCenter,
      child: FadeTransition(
        opacity: widget.animation ,
        child: MobAppBar(scaffoldKey: widget.scaffoldKey,isSmall: true,),
      ),
    ) :MobAppBar(scaffoldKey: widget.scaffoldKey,isSmall: false,);
  }
}
