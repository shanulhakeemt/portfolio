import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/data/text.dart';
import 'package:portfolio/data/url.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/date_range.dart';
import 'package:portfolio/widgets/work_point.dart';
import 'package:portfolio/widgets/work_title.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstLogicMetaLab extends StatelessWidget {
  final AutoSizeGroup pointGroup;
  final AutoSizeGroup titleGroup;
  const FirstLogicMetaLab({
    super.key,
    required this.pointGroup,
    required this.titleGroup,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        WorkTitle(
          title: WorkData.softwareEngineer2,
          company: WorkData.firstlogic,
          url: Url.firstlogic,
          group: titleGroup,
        ),
        const DateRange(start: FlitData.startDate, end: FlitData.endDate),
        const SizedBox(height: 8.0),
        _point1(),
        _point2(),
        _point3(),
        _point4(),
      ],
    );
  }

  Widget _point1() {
    return WorkPoint(
      data: AutoSizeText.rich(
        TextSpan(
          style: TextStyles.point,
          children: <TextSpan>[
            const TextSpan(text: FlitData.point1Part1),
            TextSpan(
              text: TechData.flutter,
              style: TextStyles.highlightSkill,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch(Url.flutter);
                },
            ),
            const TextSpan(text: ', '),
            TextSpan(
              text: TechData.riverpod,
              style: TextStyles.highlightSkill,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch(Url.flutter);
                },
            ),
            const TextSpan(text: FlitData.point1Part2),
            // TextSpan(
            //   text: TechData.dart,
            //   style: TextStyles.highlightSkill,
            //   recognizer: TapGestureRecognizer()
            //     ..onTap = () {
            //       launch(Url.flutter);
            //     },
            // ),
            const TextSpan(text: FlitData.point1Part3),
            // TextSpan(
            //   text: TechData.riverpod,
            //   style: TextStyles.highlightSkill,
            //   recognizer: TapGestureRecognizer()
            //     ..onTap = () {
            //       launch(Url.sass);
            //     },
            // ),
            const TextSpan(text: FlitData.point1Part4),
          ],
        ),
        maxLines: 3,
        group: pointGroup,
      ),
    );
  }

  Widget _point2() {
    return WorkPoint(
      data: AutoSizeText.rich(
        const TextSpan(
          text: FlitData.point2,
          style: TextStyles.point,
        ),
        maxLines: 3,
        group: pointGroup,
      ),
    );
  }

  Widget _point3() {
    return WorkPoint(
      data: AutoSizeText.rich(
        const TextSpan(
          style: TextStyles.point,
          children: <TextSpan>[
            TextSpan(text: FlitData.point3Part1),
            // TextSpan(
            //   text: TechData.restapi,
            //   style: TextStyles.highlightSkill,
            //   recognizer: TapGestureRecognizer()
            //     ..onTap = () {
            //       launch(Url.reactNative);
            //     },
            // ),
            TextSpan(text: FlitData.point3Part2),
          ],
        ),
        maxLines: 3,
        group: pointGroup,
      ),
    );
  }

  Widget _point4() {
    return WorkPoint(
      data: AutoSizeText.rich(
        const TextSpan(
          text: FlitData.point4,
          style: TextStyles.point,
        ),
        maxLines: 4,
        group: pointGroup,
      ),
    );
  }
}
