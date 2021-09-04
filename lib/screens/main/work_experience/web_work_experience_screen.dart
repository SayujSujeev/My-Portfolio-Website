import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/style.dart';

class WebWorkExperienceScreen extends StatelessWidget {
  const WebWorkExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: appPadding * 3),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.12,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.35,
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
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.12,
          ),
        ],
      ),
    );
  }
}
