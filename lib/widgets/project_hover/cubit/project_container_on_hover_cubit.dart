

import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectContainerOnHoverCubit extends Cubit<int> {
  ProjectContainerOnHoverCubit() : super(-1);
 changeBool(int onHoverInx) {
    emit(onHoverInx);
  }

}
