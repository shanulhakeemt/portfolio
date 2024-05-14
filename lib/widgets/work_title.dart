import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkTitle extends StatelessWidget {
  final String title;
  final String company;
  final String url;
  final AutoSizeGroup group;

  const WorkTitle({
    super.key,
    required this.title,
    required this.company,
    required this.url,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        style: TextStyles.jobTitle,
        children: <TextSpan>[
          TextSpan(text: title),
          const TextSpan(text: " "),
          TextSpan(
            text: "@ $company",
            style: TextStyles.companyTitle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(url);
              },
          ),
        ],
      ),
      maxLines: 2,
      group: group,
    );
  }
}
