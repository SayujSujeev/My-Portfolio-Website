import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/style.dart';

class MobWorkExperienceScreen extends StatelessWidget {
  const MobWorkExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: appPadding * 2,vertical: appPadding * 3),
      color: dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Working Experience',style: headTextStyleMini,),
          SizedBox(height: appPadding * 2.5,),
          Text(workExpHeadText1,style: headTextStyle3,),
          SizedBox(height: appPadding / 2,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: appPadding,vertical: appPadding / 2),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: Text(workExpTimeText1,style: headTextStyle4,),
          ),
          SizedBox(height: appPadding / 2,),
          Text(workExpSubText1,style: regularTextStyle,),

          SizedBox(height: appPadding * 2,),

          Text(workExpHeadText2,style: headTextStyle3,),
          SizedBox(height: appPadding / 2,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: appPadding,vertical: appPadding / 2),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: Text(workExpTimeText2,style: headTextStyle4,),
          ),
          SizedBox(height: appPadding / 2,),
          Text(workExpSubText2,style: regularTextStyle,),

          SizedBox(height: appPadding * 2,),

          Text(workExpHeadText3,style: headTextStyle3,),
          SizedBox(height: appPadding / 2,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: appPadding,vertical: appPadding / 2),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: Text(workExpTimeText3,style: headTextStyle4,),
          ),
          SizedBox(height: appPadding / 2,),
          Text(workExpSubText3,style: regularTextStyle,),

          SizedBox(height: appPadding * 5,),

          Text('Educational History',style: headTextStyleMini,),
          SizedBox(height: appPadding * 2.5,),

          Text(eduHisHeadText1,style: headTextStyle3,),
          SizedBox(height: appPadding / 2,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: appPadding,vertical: appPadding / 2),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: Text(eduHisTimeText1,style: headTextStyle4,),
          ),
          SizedBox(height: appPadding / 2,),
          Text(eduHisSubText1,style: regularTextStyle,),

          SizedBox(height: appPadding * 2,),

          Text(eduHisHeadText2,style: headTextStyle3,),
          SizedBox(height: appPadding / 2,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: appPadding,vertical: appPadding / 2),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: Text(eduHisTimeText2,style: headTextStyle4,),
          ),
          SizedBox(height: appPadding / 2,),
          Text(eduHisSubText2,style: regularTextStyle,),
        ],
      ),
    );
  }
}
