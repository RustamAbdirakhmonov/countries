import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial());

  TextEditingController controller = TextEditingController();

  searchCountry(value) {
    emit(CountryLoadingState());
    controller.text = value;
    controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
    emit(CountryChangeState());
  }
}
