import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/style.dart';

class Skills extends StatefulWidget {
  const Skills(
      {Key? key,
      required this.title,
      required this.score,
      required this.width,
      required this.controller})
      : super(key: key);

  final String title;
  final int score;
  final double width;
  final AnimationController controller;

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  late Animation<int> animation =
      IntTween(begin: 0, end: widget.score).animate(CurvedAnimation(
    parent: widget.controller,
    curve: Curves.easeIn,
  ));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: headTextStyle4,
          ),
          SizedBox(
            height: appPadding / 2,
          ),
          Container(
            height: 30,
            width: widget.width,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              border: Border.all(color: primary, width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Container(
                        width: widget.width * (animation.value / 100),
                        height: 24,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(50)),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
