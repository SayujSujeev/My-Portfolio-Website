import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/model/nav_item.dart';
import 'package:portfolio/utils/functions.dart';

import 'nav_item.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key, required this.scaffoldKey, required this.menuList}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<NavItemData> menuList;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<NavItemData> menuList,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => _onTapNavItem(
            context: menuList[i].key,
            navItemName: menuList[i].name,
          ),
          title: menuList[i].name,
          isMobile: true,
          isSelected: menuList[i].isSelected,
          titleStyle: textTheme.bodyText1?.copyWith(
            color:
            menuList[i].isSelected ? primary : white,
            fontSize: 16,
            fontWeight:
            menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(Spacer());
    }
    return menuItems;
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        scrollToSection(context.currentContext!);
        setState(() {
          widget.menuList[index].isSelected = true;
        });

      } else {
        widget.menuList[index].isSelected = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: Container(
        color: dark,
        child: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: white,
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2),
              ..._buildMenuList(
                context: context,
                menuList: widget.menuList,
              ),
              Spacer(flex: 6),

            ],
          ),
        ),
      ),
    );
  }
}
