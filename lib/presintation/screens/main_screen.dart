import 'package:countries/data/dbHelper.dart';
import 'package:countries/logic/user_cubit.dart';
import 'package:countries/model/user.dart';
import 'package:countries/presintation/screens/cities_screen.dart';
import 'package:countries/presintation/screens/countries_screen.dart';
import 'package:countries/presintation/screens/description_screen.dart';
import 'package:countries/presintation/screens/quiz_screen.dart';
import 'package:countries/presintation/screens/registir_screen.dart';
import 'package:countries/presintation/widgets/Button_item.dart';
import 'package:countries/presintation/widgets/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  static const routeArgs = '/main_screen';

 String? id;
 MainScreen({Key? key,this.id}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return state is LoadingState?const Center(child: CircularProgressIndicator(),):(state is SignUpState)?Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: FutureBuilder(
              future: state.getUserData(widget.id!),
              builder: ( context,
                  AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return MainAppBar(
                    url: snapshot.data!.imageUrl, nickName: snapshot.data!.nickName,);

                } else {
                  return Container();
                }
              },
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonItem(title: "Davlatlar", router: CountriesScreen.routeArgs),
                ButtonItem(title: "Shaharlar", router: CitiesScreen.routeArgs),
                ButtonItem(title: "Bayroqlar", router: DescriptionScreen.routeArgs),
                ButtonItem(title: 'Savol Javob', router: QuizScreen.routeArgs)
              ],
            ),
          ),

        ):Container();
      },
    );
  }
}
