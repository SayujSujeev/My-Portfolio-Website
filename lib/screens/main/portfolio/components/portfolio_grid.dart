import 'package:flutter/material.dart';
import 'package:portfolio/helpers/responsive_helper.dart';
import 'package:portfolio/screens/main/portfolio/components/portfolio_card.dart';

class PortfolioGrid extends StatelessWidget {
  const PortfolioGrid({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ResponsiveHelper(
      mobile: PortfolioCard(
        crossAxisCount: 1,
        childAspectRatio: 1.4,
      ),
      tablet: PortfolioCard(
        childAspectRatio: 1.4,
        crossAxisCount: 2,
      ),
      desktop: PortfolioCard(
        childAspectRatio: 1.4,
        crossAxisCount: 3,
      ),
    );
  }
}
