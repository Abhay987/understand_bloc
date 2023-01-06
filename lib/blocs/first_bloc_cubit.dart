import 'package:flutter_bloc/flutter_bloc.dart';
part 'first_bloc_state.dart';

class FirstBlocCubit extends Cubit<FirstBlocState> {
  FirstBlocCubit() : super(FirstBlocState(firstValue: 0));

  updateFirstValue({required int firstValue}) {
    emit(FirstBlocState(firstValue: firstValue));
  }
}
