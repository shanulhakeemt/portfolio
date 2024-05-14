import 'package:flutter/material.dart';
import 'package:portfolio/sections/about/about_me.dart';
import 'package:portfolio/sections/about/my_picture.dart';
import 'package:portfolio/widgets/fade_animation.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

import '../../data/keys.dart';


class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 128.0, bottom: 64.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const AboutMe(),
              SizedBox(
                  width: ResponsiveWidget.isAtLeastLargeScreen(context)
                      ? 80.0
                      : 0.0),
              if (ResponsiveWidget.isAtLeastLargeScreen(context))
                const FadeAnimation(
                  animationKey: Keys.myPicture,
                  delay: Duration(milliseconds: 1000),
                  child: MyPicture(),
                ),
            ],
          ),
          if (!ResponsiveWidget.isAtLeastLargeScreen(context))
            const FadeAnimation(
              animationKey: Keys.myPicture,
              delay: Duration(milliseconds: 1000),
              child: MyPicture(),
            ),
        ],
      ),
    );
  }
}
