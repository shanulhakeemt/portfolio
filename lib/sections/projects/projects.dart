import 'dart:convert';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/data/text.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/fade_animation.dart';
import 'package:portfolio/widgets/project.dart';
import 'package:portfolio/widgets/project_hover/getting_projects.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'package:portfolio/widgets/slide_animation.dart';
import '../../data/keys.dart';
import '../../widgets/section_title.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final options = const LiveOptions(
    delay: Duration(milliseconds: 200),
    showItemInterval: Duration(milliseconds: 100),
    showItemDuration: Duration(milliseconds: 300),
  );

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    bool isMediumScreen = ResponsiveWidget.isMediumScreen(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SlideAnimation(
            animationKey: Keys.projectsSection,
            delay: Duration(milliseconds: 50),
            child: SectionTitle(
              number: SectionTitleData.sectionNumber3,
              title: SectionTitleData.section3Title,
            ),
          ),
          BlocBuilder<GetProjectsCubit, Map<String, List>>(
            builder: (context, state) {
              return BlocBuilder<ShowAllProjectsCubit, bool>(
                builder: (context, isShowAll) {
                  final projects = isShowAll ? state["all"] : state["current"];

                  return LiveGrid.options(
                    options: options,
                    primary: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projects == null ? 0 : projects.length,
                    itemBuilder: (BuildContext context, int index,
                        Animation<double> animation) {
                      return FadeTransition(
                        opacity: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(CurvedAnimation(
                            parent: animation, curve: Curves.easeOut)),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, -0.2),
                            end: Offset.zero,
                          ).animate(animation),
                          child: Project(
                            index: index,
                            title: projects![index]['title'],
                            description: projects[index]['description'],
                            url: projects[index]['url'],
                            tags: projects[index]['tags'],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isSmallScreen
                          ? 1
                          : isMediumScreen
                              ? 2
                              : 3,
                      childAspectRatio: 1.35 / 1.25,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Center(
              child: FadeAnimation(
                animationKey: Keys.projectsButton,
                delay: const Duration(milliseconds: 50),
                child: BlocBuilder<ShowAllProjectsCubit, bool>(
                  builder: (context, isShowAll) {
                    return OutlinedButton(
                      style: ButtonStyles.primary,
                      child: Text(
                        isShowAll ? ButtonData.showLess : ButtonData.showMore,
                        style: TextStyles.buttonText,
                      ),
                      onPressed: () {
                        context
                            .read<ShowAllProjectsCubit>()
                            .updateCurrentLength(!isShowAll);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      _getJsonData();
    });
  }

  Future<void> _getJsonData() async {
    final String jsonData =
        await rootBundle.loadString('assets/project_data.json');
    final data = await jsonDecode(jsonData);
 

    if (mounted) {
      context.read<GetProjectsCubit>().addList(data["projects"]);
    }


  }
}
