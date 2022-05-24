import 'package:countries/logic/user_cubit.dart';
import 'package:countries/model/user.dart';
import 'package:countries/presintation/screens/main_screen.dart';
import 'package:countries/presintation/widgets/nickImageItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrScreen extends StatefulWidget {
  @override
  State<RegistrScreen> createState() => RegistrScreenState();

  static const routeArgs = '/register';

  RegistrScreen({Key? key}) : super(key: key);
}

class RegistrScreenState extends State<RegistrScreen> {
  String imageUrl = "";
  final textController = TextEditingController();
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    String id;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.grey.shade400,
                  Theme.of(context).backgroundColor.withOpacity(.4),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: width * .6,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: '@nickname',
                        contentPadding: EdgeInsets.only(
                            left: 15, right: 10, top: 10, bottom: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Avatarni tanlang',
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: SizedBox(
                    height: height * .5,
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 160,
                                childAspectRatio: 2 / 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected[index] = !isSelected[index];
                                  for (int i = 0; i < isSelected.length; i++) {
                                    if (i != index) {
                                      isSelected[i] = false;
                                    }
                                  }
                                });
                                setState(() {
                                  imageUrl = "assets/icons/user${index + 1}.png";
                                });
                              },
                              child: NickImageItem(
                                  imageName: "user${index + 1}",
                                  isSelected: isSelected[index]));
                        }),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {

                    !textController.value.text.isEmpty
                        ? {
                       id = DateTime.now().toString(),
                            BlocProvider.of<UserCubit>(context).singUp(User(
                                id: id,
                                imageUrl: imageUrl,
                                nickName: textController.value.text)),
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context)=>MainScreen(id: id,))
                            ),
                          }
                        : ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            backgroundColor: Colors.cyan,
                            content: Text('Nickname kiriting!'),
                            duration: Duration(milliseconds: 1500),
                          ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.cyanAccent.shade200, Colors.cyan])),
                    width: width * .5,
                    height: 80,
                    child: Center(
                        child: Text(
                      'Saqlash',
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
