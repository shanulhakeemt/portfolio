import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/sections/about/cubit/my_picture_on_hover_cubit.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/clickable_icons_hover/cubit/on_hover_icon_cubit.dart';
import 'package:portfolio/widgets/project_hover/cubit/project_container_on_hover_cubit.dart';
import 'package:portfolio/widgets/project_hover/getting_projects.dart';

void main() {
  runApp(const PersonalWebsite());
}

class PersonalWebsite extends StatelessWidget {
  const PersonalWebsite({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyPictureOnHoverCubit(),
        ),
        BlocProvider(
          create: (context) => ProjectContainerOnHoverCubit(),
        ),
        BlocProvider(
          create: (context) => ShowAllProjectsCubit(),
        ),
        BlocProvider(
          create: (context) => GetProjectsCubit(),
        ),
         BlocProvider(
          create: (context) => OnHoverIconCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shanul Hakeem | Software Developer",
        theme: ThemeData(
          backgroundColor: AppColors.backgroundBlue,
          canvasColor: AppColors.backgroundBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Calibre',
        ),
        home: const Home(),
      ),
    );
  }
}
