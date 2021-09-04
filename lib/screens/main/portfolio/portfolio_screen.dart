import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/style.dart';

import 'components/portfolio_grid.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {

  int isSelected = 0;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: appPadding * 3),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.12,
          ),
          Expanded(
            child: Column(
              children: [
                Text('See My Works',style: headTextStyle1,),
                SizedBox(height: appPadding,),
                PortfolioGrid()

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
