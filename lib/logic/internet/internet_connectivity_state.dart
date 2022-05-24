part of 'internet_connectivity_cubit.dart';
enum ConnectionType {
   wifi,
   mobile,
}
@immutable
abstract class InternetConnectivityState {}

class InternetConnectivityInitial extends InternetConnectivityState {}

class InternetLoading extends InternetConnectivityState {}

class InternetConnected extends InternetConnectivityState {
   final ConnectionType connectionType;

   InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetConnectivityState {}