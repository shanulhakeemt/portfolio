import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/data/text.dart';
import 'package:portfolio/data/url.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/clickable_icon.dart';
import 'package:portfolio/widgets/fade_animation.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'package:portfolio/widgets/slide_animation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/keys.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SlideAnimation(
                  animationKey: Keys.footerText,
                  delay: const Duration(milliseconds: 50),
                  child: _footerText(context),
                ),
                const SizedBox(height: 32.0),
                SlideAnimation(
                  animationKey: Keys.footerContact,
                  delay: const Duration(milliseconds: 150),
                  child: _contact(),
                ),
                const SizedBox(height: 40.0),
                SlideAnimation(
                  animationKey: Keys.socialMedia,
                  delay: const Duration(milliseconds: 250),
                  child: _socialMedia(context),
                ),
                const SizedBox(height: 40.0),
                FadeAnimation(
                  animationKey: Keys.copyright,
                  delay: const Duration(milliseconds: 350),
                  child: _copyright(),
                ),
                // const SizedBox(height: 12.0),
                // FadeAnimation(
                //   animationKey: Keys.sourceCode,
                //   delay: const Duration(milliseconds: 450),
                //   child: _sourceCode(),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contact() {
    return AutoSizeText.rich(
      TextSpan(
        style: TextStyles.contact,
        children: <TextSpan>[
          const TextSpan(
            text: FooterData.contactPart1,
          ),
          TextSpan(
            text: FooterData.contactPart2,
            style: TextStyles.highlightContact,
            recognizer: TapGestureRecognizer()..onTap = () => launch(Url.email),
          ),
          const TextSpan(
            text: FooterData.contactPart3,
          ),
          TextSpan(
              text: FooterData.contactPart4,
              style: TextStyles.highlightContact,
              recognizer: TapGestureRecognizer()
              // ..onTap = () => launch('7592072890'),
              ),
          const TextSpan(
            text: FooterData.contactPart5,
          ),
        ],
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }

  Widget _copyright() {
    return const AutoSizeText(
      FooterData.copyright,
      style: TextStyles.copyright,
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }

  Widget _footerText(BuildContext context) {
    return const AutoSizeText.rich(
      TextSpan(
        style: TextStyles.footer,
        children: [
          TextSpan(text: FooterData.footerTextPart1),
          TextSpan(text: FooterData.footerTextPart2),
          // ResponsiveWidget.isSmallScreen(context)
          //     ? const TextSpan(
          //         style: TextStyles.footer,
          //         children: [
          //           // TextSpan(text: FooterData.footerTextPart3Alt1),
          //           // TextSpan(text: FooterData.footerTextPart3Alt2),
          //         ],
          //       )
          //     : const
          // TextSpan(text: FooterData.footerTextPart3),
        ],
      ),
      textAlign: TextAlign.center,
      presetFontSizes: [14, 10],
      maxLines: 4,
    );
  }

  Widget _socialMedia(BuildContext context) {
    final iconSize = ResponsiveWidget.isSmallScreen(context) ? 24.0 : 32.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClickableIcon(
          index: 0,
          icon: FontAwesomeIcons.github,
          iconSize: iconSize,
          url: Url.github,
        ),
        const SizedBox(width: 24.0),
        ClickableIcon(
          index: 1,
          icon: FontAwesomeIcons.instagram,
          iconSize: iconSize,
          url: Url.instagram,
        ),
        const SizedBox(width: 24.0),
        ClickableIcon(
          index: 2,
          icon: FontAwesomeIcons.linkedinIn,
          iconSize: iconSize,
          url: Url.linkedin,
        ),
        // const SizedBox(width: 24.0),
        // ClickableIcon(
        //   icon: FontAwesomeIcons.twitter,
        //   iconSize: iconSize,
        //   url: Url.twitter,
        // ),
        // const SizedBox(width: 24.0),
        // ClickableIcon(
        //   icon: FontAwesomeIcons.youtube,
        //   iconSize: iconSize,
        //   url: Url.youtube,
        // ),
        // const SizedBox(width: 24.0),
        // ClickableIcon(
        //   icon: FontAwesomeIcons.spotify,
        //   iconSize: iconSize,
        //   url: Url.spotify,
        // ),
      ],
    );
  }
}
