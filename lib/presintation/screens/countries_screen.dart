import 'package:countries/logic/country/country_cubit.dart';
import 'package:countries/logic/internet/internet_connectivity_cubit.dart';
import 'package:countries/model/countries.dart';
import 'package:countries/presintation/screens/description_screen.dart';
import 'package:countries/presintation/widgets/country_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({Key? key}) : super(key: key);
  static const routeArgs = "/countries";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            'Davlatlar',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                      content: Container(
                        width: MediaQuery.of(context).size.width * .6,
                        padding: const EdgeInsets.only(
                          left: 30,
                        ),
                        margin: const EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          controller: BlocProvider.of<CountryCubit>(context).controller,
                          style: const TextStyle(fontSize: 25, decoration: TextDecoration.none),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          onChanged: (value) {
                            context.read<CountryCubit>().searchCountry(value);
                          },
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(), child: Text("DISMISS")),
                      ]));
                },
                icon: const Icon(
                  Icons.search,
                  size: 24,
                ))
          ],
        ),
        body: BlocBuilder<InternetConnectivityCubit, InternetConnectivityState>(
          builder: (context, state) {
            return state is InternetConnected
                ? Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: Hive.openBox<Countries>('countries'),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return BlocBuilder<CountryCubit, CountryState>(
                            builder: (context, state) {
                              return ListView.builder(
                                shrinkWrap: true,
                                semanticChildCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return snapshot.data.get('$index').countryName.contains(context.watch<CountryCubit>().controller.text)
                                      ? (state is CountryChangeState || state is CountryInitial)
                                          ? Align(
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => DescriptionScreen(
                                                            flagUrl: snapshot.data.get('$index').flagUrl,
                                                            area: snapshot.data.get('$index').area.toString(),
                                                            coatOfArms: snapshot.data.get('$index').coatOfArms,
                                                            countryName: snapshot.data.get('$index').countryName,
                                                            maps: snapshot.data.get('$index').maps,
                                                            population: snapshot.data.get('$index').population.toString(),
                                                            region: snapshot.data.get('$index').region,
                                                            timeZone: snapshot.data.get('$index').timeZone,
                                                          )));
                                                },
                                                child: CountryItemWidget(countryName: snapshot.data.get('$index').countryName ?? "...", flagsUrl: snapshot.data.get('$index').flagUrl ?? "..."),
                                              ),
                                            )
                                          : SizedBox()
                                      : SizedBox();
                                },
                                itemCount: snapshot.data.length,
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                      },
                    ),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                          child: CupertinoActivityIndicator(radius: 25),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text('Internet disconnected', style: Theme.of(context).textTheme.headline1),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
