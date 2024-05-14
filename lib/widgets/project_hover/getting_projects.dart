import 'package:flutter_bloc/flutter_bloc.dart';

class GetProjectsCubit extends Cubit<Map<String, List>> {
  GetProjectsCubit() : super({});

  addList(List list) {
    emit({
      "all": [...list],
      "current": [list[0], list[1], list[2]]
    });
  }

  addElementsToList() {
    emit(
      {
      "all": state["all"]??[],
      "current":state["all"]??[]
    }
    );  
  }
   removeElementsFromList() {
    emit(
      {
      "all": state["all"]??[],
      "current": [state["all"]![0], state["all"]![1], state["all"]![2]]
    }
    );  
  }
}

class ShowAllProjectsCubit extends Cubit<bool> {
  ShowAllProjectsCubit() : super(false);
  updateCurrentLength(bool isShowAll) {
    emit(isShowAll);
  }
}
