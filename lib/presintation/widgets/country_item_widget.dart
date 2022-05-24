import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CountryItemWidget extends StatelessWidget {
   CountryItemWidget({Key? key,required this.countryName,required this.flagsUrl}) : super(key: key);
  String flagsUrl;
  String countryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.9,
      height: 80,
      margin: const EdgeInsets.only(bottom: 15),
      padding:const EdgeInsets.all(10),

      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red.shade300,width: 2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0,2),
            color: Colors.grey.shade300,
            blurRadius: 4
          )
        ]

      ),
      child: Row(
        children: <Widget>[
          SvgPicture.network(flagsUrl,width: 40,),
          const SizedBox(width: 20,),
          SizedBox(width: MediaQuery.of(context).size.width*.6,
          child: Text(countryName,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w300,overflow: TextOverflow.fade)),
          )
        ],
      ),
    );
  }
}
