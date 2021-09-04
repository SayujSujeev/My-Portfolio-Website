import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/helpers/responsive_helper.dart';
import 'package:portfolio/model/nav_item.dart';
import 'package:portfolio/screens/main/appbar/mob_app_bar_transition.dart';
import 'package:portfolio/screens/main/appbar/web_app_bar_transition.dart';
import 'package:portfolio/screens/main/my_skill/mob_my_skill_screen.dart';
import 'package:portfolio/screens/main/my_skill/web_my_skill_screen.dart';
import 'package:portfolio/screens/main/portfolio/portfolio_screen.dart';
import 'package:portfolio/screens/main/work_experience/mob_work_experience_screen.dart';
import 'package:portfolio/screens/main/work_experience/web_work_experience_screen.dart';
import 'package:portfolio/utils/functions.dart';

import 'about/mob_about_screen.dart';
import 'about/web_about_screen.dart';
import 'appbar/components/app_drawer.dart';
import 'footer/footer_screen.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{

  bool doChange=false;
  ScrollController? _scrollController=ScrollController();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 50),
    vsync: this,
  );
  late final Animation<double> animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );


  @override
  void initState() {
    super.initState();

    _scrollController?.addListener(() {

      if (_scrollController!.position.pixels >=10) {
        setState(() {
          _controller.forward();
          doChange=true;

        });
      } else if(_scrollController!.position.pixels <=40) {
        setState(() {
          _controller.reverse();
          doChange=false;
        });

      }
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<NavItemData> navItems = [
    NavItemData(name: "HOME", key: GlobalKey(), isSelected: true),
    NavItemData(name: "ABOUT", key: GlobalKey()),
    NavItemData(name: "PORTFOLIO", key: GlobalKey()),
    NavItemData(name: "CONTACT", key: GlobalKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: dark,
      endDrawer: AppDrawer(scaffoldKey: scaffoldKey, menuList: navItems,),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 60,),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HomeScreen(key: navItems[0].key,),
                      if(ResponsiveHelper.isDesktop(context))
                        WebAboutScreen(key: navItems[1].key,),
                      if(!ResponsiveHelper.isDesktop(context))
                        MobAboutScreen(),
                      if(ResponsiveHelper.isDesktop(context))
                        WebMySkillScreen(),
                      if(!ResponsiveHelper.isDesktop(context))
                        MobMySkillScreen(),
                      if(ResponsiveHelper.isDesktop(context))
                        WebWorkExperienceScreen(),
                      if(!ResponsiveHelper.isDesktop(context))
                        MobWorkExperienceScreen(),

                        PortfolioScreen(key: navItems[2].key,),
                        FooterScreen(key: navItems[3].key,),

                      // Container(height: 20,color: dark,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if(ResponsiveHelper.isDesktop(context))
            WebAppBarTransition(doChange: doChange, animation: animation, navItems: navItems,),
          if(!ResponsiveHelper.isDesktop(context))
            MobAppBarTransition(doChange: doChange, animation: animation, scaffoldKey: scaffoldKey),
        ],
      ),
    );
  }
}
