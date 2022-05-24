part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoadingState extends CountryState {}

class CountryChangeState extends CountryState {}
