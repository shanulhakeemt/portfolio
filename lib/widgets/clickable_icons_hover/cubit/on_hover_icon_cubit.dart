import 'package:flutter_bloc/flutter_bloc.dart';

class OnHoverIconCubit extends Cubit<int> {
  OnHoverIconCubit() : super(-1);
  updateHoverIndex(int hoverIndex) {
    emit(hoverIndex);
  }
}
