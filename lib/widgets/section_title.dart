import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/responsive_widget.dart';


class SectionTitle extends StatelessWidget {
  final String number;
  final String title;

  const SectionTitle({
    super.key,
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _sectionNumber(number),
          SizedBox(width: ResponsiveWidget.isSmallScreen(context) ? 10 : 20),
          _sectionTitle(title),
          SizedBox(width: ResponsiveWidget.isSmallScreen(context) ? 10 : 20),
          _line(context),
        ],
      ),
    );
  }

  Widget _line(BuildContext context) {
    const height = 1.0;
    double width = MediaQuery.of(context).size.width;
    Color color = AppColors.mediumGrey2.withOpacity(0.5);

    return ResponsiveWidget.isAtLeastLargeScreen(context)
        ? Container(
            height: height,
            width: width / 4.5,
            color: color,
          )
        : Flexible(
            child: Container(
              height: height,
              color: color,
            ),
          );
  }

  Widget _sectionNumber(String number) {
    return Container(
      transform: Matrix4.translationValues(0.0, -4.0, 0.0),
      child: AutoSizeText(
        number,
        style: TextStyles.sectionNumber,
        maxLines: 1,
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return AutoSizeText(
      title,
      style: TextStyles.sectionTitle,
      maxLines: 1,
    );
  }
}
