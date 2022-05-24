import 'package:countries/model/countries.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class CountriesService {
  static getCategories() async {
    final _dio = Dio();

    var box = await Hive.openBox<Countries>('countries');
    if(box.isEmpty){

      final res = await _dio.get(
        'https://restcountries.com/v3.1/all',
      );
      print(res.data.length);
      if (res.statusCode == 200) {
        int counter=0;
        for (int i = 0; i < res.data.length; i++) {
          (res.data[i]['name']['common']!=null&&
              res.data[i]['capital']!=null&&
              res.data[i]['region']!=null&&
              res.data[i]['area']!=null&&
              res.data[i]['population']!=null&&
              res.data[i]['flags']['svg']!=null&&
              res.data[i]['timezones'][0]!=null&&
              res.data[i]['maps']['googleMaps']!=null&&
              res.data[i]['coatOfArms']['svg']!=null
          )? {await box.put(
              '$counter',
              Countries(
                  countryName: res.data[i]['name']['common'],
                  capital: res.data[i]['capital'][0],
                  region: res.data[i]['region'],
                  area: res.data[i]['area'],
                  population: res.data[i]['population'],
                  flagUrl: res.data[i]['flags']['svg'],
                  timeZone: res.data[i]['timezones'][0],
                  maps: res.data[i]['maps']['googleMaps'],
                  coatOfArms: res.data[i]['coatOfArms']['svg'])),
            counter++,


          }:Container();
        }
      }
    }
  }
}
