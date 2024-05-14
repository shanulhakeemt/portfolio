import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/theme.dart';

class DateRange extends StatelessWidget {
  final String start;
  final String end;

  const DateRange({
    super.key,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "$start - $end",
      style: TextStyles.date,
      maxLines: 1,
    );
  }
}
