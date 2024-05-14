import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/assetConstants.dart';
import 'package:portfolio/sections/about/cubit/my_picture_on_hover_cubit.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class MyPicture extends StatefulWidget {
  const MyPicture({super.key});

  @override
  State<MyPicture> createState() => _MyPictureState();
}

class _MyPictureState extends State<MyPicture> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final frameHovered = Matrix4.identity()..translate(-6, -12, 0);
    // final frameTransform = isHovered ? frameHovered : Matrix4.identity();

    final pictureHovered = Matrix4.identity()..translate(-2, -4, 0);
    // final pictureTransform = isHovered ? pictureHovered : Matrix4.identity();

    const duration = Duration(milliseconds: 300);

    return Padding(
      padding: EdgeInsets.only(
          top: ResponsiveWidget.isAtLeastLargeScreen(context) ? 32.0 : 80.0),
      child: MouseRegion(
        onEnter: (_) => onEntered(true, context),
        onExit: (_) => onEntered(false, context),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            BlocBuilder<MyPictureOnHoverCubit, bool>(
              builder: (context, state) {
                return AnimatedContainer(
                  duration: duration,
                  transform: state ? frameHovered : Matrix4.identity(),
                  child: Container(
                    height: ResponsiveWidget.isLargeScreen(context)
                        ? width / 5.5
                        : width / 1.75,
                    width: ResponsiveWidget.isLargeScreen(context)
                        ? width / 7.25
                        : width / 2.25,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.blueAccent, width: 3.0),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<MyPictureOnHoverCubit, bool>(
              builder: (context, state) {
                return Positioned(
                  top: -20,
                  bottom: 20,
                  right: 20,
                  child: AnimatedContainer(
                    duration: duration,
                    transform: state ? pictureHovered : Matrix4.identity(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        AssetConstants.avtar,
                        scale: 1,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void onEntered(bool isHovered, BuildContext context) {
    context.read<MyPictureOnHoverCubit>().changeBool(isHovered);
  }
}
