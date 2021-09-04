import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/style.dart';
import 'package:portfolio/model/nav_item.dart';
import 'package:portfolio/screens/main/appbar/components/nav_item.dart';
import 'package:portfolio/utils/functions.dart';

import 'logo_container.dart';

class WebAppBar extends StatefulWidget {
  const WebAppBar({Key? key, required this.isSmall, required this.navItems})
      : super(key: key);

  final bool isSmall;
  final List<NavItemData> navItems;

  @override
  _WebAppBarState createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {


  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.navItems.length; index++) {
      if (navItemName == widget.navItems[index].name) {

        scrollToSection(context.currentContext!);
        setState(() {
          widget.navItems[index].isSelected = true;
        });
      } else {
        widget.navItems[index].isSelected = false;
      }
    }
  }

  List<Widget> _buildNavItems(List<NavItemData> navItems) {
    List<Widget> items = [];
    for (int index = 0; index < navItems.length; index++) {
      items.add(
        NavItem(
          title: navItems[index].name,
          isSelected: navItems[index].isSelected,
          onTap: () => _onTapNavItem(
            context: navItems[index].key,
            navItemName: navItems[index].name,
          ),
        ),
      );
      items.add(Spacer());
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: widget.isSmall ? 60 : 90,
      decoration: BoxDecoration(
        color: dark,
        boxShadow: [
          BoxShadow(
            color: widget.isSmall ? black.withOpacity(0.5) : Colors.transparent,
            offset: Offset(0, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: size.width * 0.12,
              ),
              LogoContainer(),
            ],
          ),

          Spacer(
            flex: 20,
          ),
          ..._buildNavItems(widget.navItems),

          SizedBox(
            width: size.width * 0.12,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         TextButton(
          //           child: Text(
          //             'HOME',
          //             style: appBarTxtSyl,
          //           ),
          //           onPressed: () {},
          //         ),
          //         SizedBox(
          //           height: appPadding / 3,
          //         ),
          //         Container(
          //           width: 40,
          //           height: 2,
          //           color: primary,
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       width: appPadding * 1.5,
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         TextButton(
          //           child: Text(
          //             'ABOUT',
          //             style: appBarTxtSyl,
          //           ),
          //           onPressed: () {},
          //         ),
          //         SizedBox(
          //           height: appPadding / 3,
          //         ),
          //         Container(
          //           width: 40,
          //           height: 2,
          //           color: Colors.transparent,
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       width: appPadding * 1.5,
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         TextButton(
          //           child: Text(
          //             'SERVICE',
          //             style: appBarTxtSyl,
          //           ),
          //           onPressed: () {},
          //         ),
          //         SizedBox(
          //           height: appPadding / 3,
          //         ),
          //         Container(
          //           width: 40,
          //           height: 2,
          //           color: Colors.transparent,
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       width: appPadding * 1.5,
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         TextButton(
          //           child: Text(
          //             'PORTFOLIO',
          //             style: appBarTxtSyl,
          //           ),
          //           onPressed: () {},
          //         ),
          //         SizedBox(
          //           height: appPadding / 3,
          //         ),
          //         Container(
          //           width: 40,
          //           height: 2,
          //           color: Colors.transparent,
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       width: appPadding * 1.5,
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         TextButton(
          //           child: Text(
          //             'CONTACT',
          //             style: appBarTxtSyl,
          //           ),
          //           onPressed: () {},
          //         ),
          //         SizedBox(
          //           height: appPadding / 3,
          //         ),
          //         Container(
          //           width: 40,
          //           height: 2,
          //           color: Colors.transparent,
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       width: size.width * 0.12,
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
