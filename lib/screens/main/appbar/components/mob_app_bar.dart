import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/screens/main/appbar/components/logo_container.dart';

class MobAppBar extends StatelessWidget {
  const MobAppBar({Key? key, required this.scaffoldKey, required this.isSmall}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: isSmall ? 60 : 90,
      decoration: BoxDecoration(
        color: dark,
        boxShadow: [
          BoxShadow(
            color: isSmall ? black.withOpacity(0.5) : Colors.transparent,
            offset: Offset(0, 3),
            blurRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LogoContainer(),
          IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
            icon: Icon(Icons.menu,color: white,size: 30,),
          )
        ],
      ),
    );
  }
}
