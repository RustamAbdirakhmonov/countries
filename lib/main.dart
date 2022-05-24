import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:countries/logic/country/country_cubit.dart';
import 'package:countries/logic/internet/internet_connectivity_cubit.dart';
import 'package:countries/logic/user_cubit.dart';
import 'package:countries/model/countries.dart';
import 'package:countries/presintation/screens/cities_screen.dart';
import 'package:countries/presintation/screens/countries_screen.dart';
import 'package:countries/presintation/screens/description_screen.dart';
import 'package:countries/presintation/screens/main_screen.dart';
import 'package:countries/presintation/screens/quiz_screen.dart';
import 'package:countries/presintation/screens/registir_screen.dart';
import 'package:countries/presintation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocsDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocsDir.path);
  Hive.registerAdapter(CountriesAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => UserCubit()),
        BlocProvider(create: (context) => InternetConnectivityCubit(connectivity: Connectivity())),
        BlocProvider(create: (context) => CountryCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Countries',
        theme: ThemeData(
          fontFamily: 'SignikaNegative',
          primaryColor: Colors.cyanAccent.shade100,
          textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'SignikaNegative', fontWeight: FontWeight.w400), bodyText2: TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'SignikaNegative', fontWeight: FontWeight.w600), headline1: TextStyle(color: Colors.black, fontSize: 26, fontFamily: 'SignikaNegative', fontWeight: FontWeight.w700)),
        ),
        home: SplashScreen(),
        routes: {
          RegistrScreen.routeArgs: (context) => RegistrScreen(),
          SplashScreen.routeArgs: (context) => const SplashScreen(),
          MainScreen.routeArgs: (context) => MainScreen(),
          CountriesScreen.routeArgs: (context) => CountriesScreen(),
          DescriptionScreen.routeArgs: (context) => DescriptionScreen(),
          QuizScreen.routeArgs: (context) => const QuizScreen(),
          CitiesScreen.routeArgs: (context) => const CitiesScreen(),
        },
      ),
    );
  }
}
