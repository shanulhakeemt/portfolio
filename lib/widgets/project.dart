import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/clickable_icon.dart';
import 'package:portfolio/widgets/project_hover/cubit/project_container_on_hover_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class Project extends StatefulWidget {
  final String title;
  final String description;
  final String url;
  final List tags;
  final int index;

  const Project({
    super.key,
    required this.title,
    required this.description,
    required this.url,
    required this.tags,
    required this.index,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    final frameHovered = Matrix4.identity()..scale(1.035);
    return MouseRegion(
      onEnter: (_) => onEntered(widget.index, context),
      onExit: (_) => onEntered(-1, context),
      cursor:
          _containsUrl() ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: BlocBuilder<ProjectContainerOnHoverCubit, int>(
        builder: (context, state) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 225),
            transformAlignment: Alignment.center,
            transform: state==widget.index ? frameHovered : Matrix4.identity(),
            child: GestureDetector(
              onTap: () => _containsUrl() ? launch(widget.url) : {},
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                color: AppColors.blueOffset,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _titleAndGithub(state),
                            const SizedBox(height: 12.0),
                            _description(),
                          ],
                        ),
                      ),
                      _tags(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onEntered(int isHoveredInx, BuildContext context) {
    context.read<ProjectContainerOnHoverCubit>().changeBool(isHoveredInx);
  }

  bool _containsUrl() {
    return widget.url != "";
  }

  Widget _description() {
    return Flexible(
      child: AutoSizeText(
        widget.description,
        style: TextStyles.project,
        maxLines: 5,
      ),
    );
  }

  Widget _tags() {
    return Flexible(
      child: Row(
        children: [
          for (var tag in widget.tags)
            Row(
              children: [
                AutoSizeText(
                  tag,
                  style: TextStyles.projectSkill,
                ),
                const SizedBox(width: 16.0),
              ],
            ),
        ],
      ),
    );
  }

  Widget _titleAndGithub(int isHoveredIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: AutoSizeText(
            widget.title,
            style: TextStyles.projectTitle.copyWith(
                color: isHoveredIndex==widget.index ? AppColors.blueAccent : AppColors.lightGrey2),
            maxLines: 2,
          ),
        ),
        if (_containsUrl())
          ClickableIcon(
            index: isHoveredIndex,
            icon: FontAwesomeIcons.github,
            iconSize: 20.0,
            iconColor: AppColors.mediumGrey1,
            url: widget.url,
          ),
      ],
    );
  }
}
