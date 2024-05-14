import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/clickable_icons_hover/cubit/on_hover_icon_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableIcon extends StatefulWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final int index;
  final String url;
  const ClickableIcon(
      {super.key,
      required this.icon,
      required this.index,
      required this.iconSize,
      required this.url,
      this.iconColor = AppColors.lightGrey1});

  @override
  State<ClickableIcon> createState() => _ClickableIconState();
}

class _ClickableIconState extends State<ClickableIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnHoverIconCubit, int>(
      builder: (context, state) {
        return MouseRegion(
          onEnter: (event) {
            context.read<OnHoverIconCubit>().updateHoverIndex(widget.index);
          },
          onExit: (event) {
            context.read<OnHoverIconCubit>().updateHoverIndex(-1);
          },
          child: IconButton(
            padding: const EdgeInsets.all(0.0),
            constraints: const BoxConstraints(),
            icon: FaIcon(widget.icon),
            iconSize: widget.iconSize,
            color:
                state == widget.index ? AppColors.blueAccent : widget.iconColor,
            onPressed: () => launch(widget.url),
          ),
        );
      },
    );
  }
}
