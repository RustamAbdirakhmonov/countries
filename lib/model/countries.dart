
import 'package:hive/hive.dart';


part 'countries.g.dart';

@HiveType(typeId: 1)
class Countries{

  @HiveField(0)
  String countryName;
  @HiveField(1)
  String capital;
  @HiveField(2)
  String region;
  @HiveField(3)
  double area;
  @HiveField(4)
  int population;
  @HiveField(5)
  String flagUrl;
  @HiveField(6)
  String timeZone;
  @HiveField(7)
  String maps;
  @HiveField(8)
  String coatOfArms;

  Map<String, dynamic> toJson() {
    return {
      "countryName": this.countryName,
      "capital": this.capital,
      "region": this.region,
      "area": this.area,
      'population':this.population,
      "flagUrl": this.flagUrl,
      "timeZone": this.timeZone,
      "maps": this.maps,
      "coatOfArms": this.coatOfArms,
    };

  }

  Countries({
    required this.countryName,
    required this.capital,
    required this.region,
    required this.area,
    required this.population,
    required this.flagUrl,
    required this.timeZone,
    required this.maps,
    required this.coatOfArms,
  });

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      countryName: json["countryName"],
      capital: json["capital"],
      region: json["region"],
      area: json["area"],
      population: json["population"],
      flagUrl: json["flagUrl"],
      timeZone: json["timeZone"],
      maps: json["maps"],
      coatOfArms: json["coatOfArms"],
    );
  }
//

}