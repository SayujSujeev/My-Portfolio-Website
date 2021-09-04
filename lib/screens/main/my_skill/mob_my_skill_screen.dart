import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/style.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'components/skills.dart';

class MobMySkillScreen extends StatefulWidget {
  const MobMySkillScreen({Key? key}) : super(key: key);

  @override
  _MobMySkillScreenState createState() => _MobMySkillScreenState();
}

class _MobMySkillScreenState extends State<MobMySkillScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double skillWidth = size.width * 0.8;

    return VisibilityDetector(
      key: Key('statistics-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 30) {
          _controller.forward();
        }
      },
      child: Container(
        color: dark,
        padding: EdgeInsets.symmetric(horizontal: appPadding * 2,vertical: appPadding * 3),
        child: Column(
          children: [
            Text('My Skills',style: headTextStyle1,),
            SizedBox(height: appPadding,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Coding Skills',style: headTextStyle3,),
                Skills(title: 'Dart / Flutter Frame Work', score: 95, width: skillWidth, controller: _controller,),
                Skills(title: 'Java', score: 70,width: skillWidth,controller: _controller,),
                Skills(title: 'Python', score: 80,width: skillWidth,controller: _controller,),
                Skills(title: 'C / C++', score: 90,width:skillWidth,controller: _controller,),
                Skills(title: 'CSS / HTML', score: 55,width: skillWidth,controller: _controller,),
                Skills(title: 'PHP', score: 50,width: skillWidth,controller: _controller,),
              ],
            ),
            SizedBox(height: appPadding * 3,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Design Skills',style: headTextStyle3,),
                Skills(title: 'UI - UX Design', score: 80,width: skillWidth,controller: _controller,),
                Skills(title: 'Photoshop', score: 90,width: skillWidth,controller: _controller,),
                Skills(title: 'Illustrator', score: 65,width: skillWidth,controller: _controller,),
                Skills(title: 'Figma', score: 85,width: skillWidth,controller: _controller,),
                Skills(title: 'XD', score: 80,width: skillWidth,controller: _controller,),
                Skills(title: 'After Effects', score: 70,width: skillWidth,controller: _controller,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
