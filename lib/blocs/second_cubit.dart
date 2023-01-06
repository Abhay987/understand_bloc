
import 'package:flutter_bloc/flutter_bloc.dart';

part 'second_state.dart';

class SecondCubit extends Cubit<SecondState> {
  SecondCubit() : super(SecondState(secondValue: "Abhay_0"));

  secondCubitUpdate({required String secondValue}) {
    emit(SecondState(secondValue: secondValue));
  }

}
