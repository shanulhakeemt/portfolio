import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/assetConstants.dart';

import 'package:portfolio/data/text.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/fade_animation.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'package:portfolio/widgets/slide_animation.dart';

import '../../data/keys.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    const sliverAppBarHeight = 90;
    double height = MediaQuery.of(context).size.height - 2 * sliverAppBarHeight;

    return Container(
      height: height,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (ResponsiveWidget.isAtLeastLargeScreen(context))
            FadeAnimation(
              animationKey: Keys.backgroundPicture,
              delay: const Duration(milliseconds: 750),
              child: Image.asset(
               AssetConstants.avtNoBg
               ,
                width: 250,
                fit: BoxFit.fill,
                scale: ResponsiveWidget.isMediumScreen(context) ? 4.0 : 2.5,
              ),
            ),
          SizedBox(
              width: ResponsiveWidget.isAtLeastLargeScreen(context) ? 30 : 0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlideAnimation( 
                  animationKey: Keys.greeting,
                  delay: const Duration(milliseconds: 750),
                  child: _greeting(),
                ),
                const SizedBox(height: 25.0),
                SlideAnimation(
                  animationKey: Keys.nameTitle,
                  delay: const Duration(milliseconds: 850),
                  child: _nameAndTitle(context),
                ),
                SizedBox(
                    height: ResponsiveWidget.isSmallScreen(context) ? 16 : 0),
                SlideAnimation(
                  animationKey: Keys.introText,
                  delay: const Duration(milliseconds: 900),
                  child: _about(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _about() {
    return AutoSizeText.rich(
      TextSpan(
        style: TextStyles.paragraph,
        children: <TextSpan>[
          const TextSpan(text: IntroData.about),
        ],
      ),
      maxLines: 5,
    );
  }

  Widget _greeting() {
    return const AutoSizeText(
      IntroData.greeting,
      style: TextStyles.greeting,
      maxLines: 1,
    );
  }

  Widget _nameAndTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          IntroData.name,
          style: TextStyles.headline1,
          maxLines: 1,
          maxFontSize: ResponsiveWidget.isSmallScreen(context) ? 40 : 72,
        ),
        Container(
          transform: !ResponsiveWidget.isSmallScreen(context)
              ? Matrix4.translationValues(0.0, -12.0, 0.0)
              : null,
          child: AutoSizeText(
            IntroData.title,
            style: TextStyles.headline1,
            maxLines: 1,
            maxFontSize: ResponsiveWidget.isSmallScreen(context) ? 40 : 72,
          ),
        ),
      ],
    );
  }
}
