import 'package:countries/model/service/counties_service.dart';
import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  ButtonItem({Key? key, required this.title, required this.router}) : super(key: key);
  String title;
  String router;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        CountriesService.getCategories();
        Navigator.of(context).pushNamed(router);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        width: size.width * .6,
        height: 60,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.cyanAccent.shade100),
      ),
    );
  }
}
