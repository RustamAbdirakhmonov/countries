import 'package:flutter/material.dart';
class NickImageItem extends StatelessWidget {
  NickImageItem({Key? key,required this.imageName,required this.isSelected}) : super(key: key);
  String imageName;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;

    return Container(

      width:width*.15,
      height: width*.15,
      padding: EdgeInsets.all(5),
      child: Image.asset("assets/icons/${imageName}.png",fit: BoxFit.contain,),
      decoration: BoxDecoration(
         border: isSelected?Border.all(width: 4,color: Colors.blue):Border(),
        shape: BoxShape.circle
      ),
    );
  }
}
