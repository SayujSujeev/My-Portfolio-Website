import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/padding.dart';
import 'package:portfolio/constants/style.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/model/portfolio_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PortfolioCard extends StatefulWidget {
  const PortfolioCard({
    Key? key,
    required this.crossAxisCount,
    required this.childAspectRatio,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> with SingleTickerProviderStateMixin {

  late AnimationController _projectController;
  late Animation<double> _projectScaleAnimation;

  @override
  void initState() {
    super.initState();
    // selectedProject = projects[0];
    // projectCategories = Data.projectCategories;
    _projectController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _projectScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _projectController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _projectController.dispose();
    super.dispose();
  }

  Future<void> _playProjectAnimation() async {
    try {
      await _projectController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Widget buildServicesCard(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    PortfolioModel portfolioModel = portfolioData[index];

    return VisibilityDetector(
      key: Key('project-section-sm'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 20) {
          _playProjectAnimation();
        }
      },
      child: ScaleTransition(
        scale: _projectScaleAnimation,
        child: InkWell(
          onTap: () {},
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  portfolioModel.imageUrl,
                  gaplessPlayback: true,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                padding: EdgeInsets.only(left: appPadding),
                decoration: BoxDecoration(
                  color: dark.withOpacity(0.7),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        portfolioModel.name,
                        style: headTextStyle3,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: portfolioData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: appPadding,
        mainAxisSpacing: appPadding,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return buildServicesCard(context, index);
      },
    );
  }
}
