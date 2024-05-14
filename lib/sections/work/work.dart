import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/data/keys.dart';
import 'package:portfolio/data/text.dart';
import 'package:portfolio/sections/work/flit.dart';
import 'package:portfolio/widgets/fade_animation.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'package:portfolio/widgets/slide_animation.dart';

import '../../widgets/section_title.dart';

class Work extends StatelessWidget {
  const Work({super.key});

  @override
  Widget build(BuildContext context) {
    AutoSizeGroup pointGroup = AutoSizeGroup();
    AutoSizeGroup titleGroup = AutoSizeGroup();

    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
        bottom: 64.0,
        right: ResponsiveWidget.isAtLeastLargeScreen(context) ? 136.0 : 0.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SlideAnimation(
            animationKey: Keys.workSection,
            delay: Duration(milliseconds: 50),
            child: SectionTitle(
              number: SectionTitleData.sectionNumber2,
              title: SectionTitleData.section2Title,
            ),
          ),
          FadeAnimation(
            animationKey: Keys.firstLogicMetaLab,
            delay: const Duration(milliseconds: 100),
            child: FirstLogicMetaLab(
                pointGroup: pointGroup, titleGroup: titleGroup),
          ),
        ],
      ),
    );
  }
}
