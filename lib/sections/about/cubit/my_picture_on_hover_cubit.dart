import 'package:flutter_bloc/flutter_bloc.dart';

class MyPictureOnHoverCubit extends Cubit<bool> {
  MyPictureOnHoverCubit() : super(false);

  changeBool(bool onHover) {
    emit(onHover);
  }
}
