import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DescriptionScreen extends StatefulWidget {
  static const routeArgs = "/flags";
  String? flagUrl;
  String? countryName;
  String? region;
  String? area;
  String? coatOfArms;
  String? population;
  String? timeZone;
  String? maps;

  DescriptionScreen({
    this.flagUrl,
    this.countryName,
    this.region,
    this.area,
    this.coatOfArms,
    this.population,
    this.timeZone,
    this.maps,
  });

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  final String currentTime = "";

  String getSystemTime() {
    int hour = widget.timeZone!.length >= 5 ? int.parse(((widget.timeZone![3]) + (widget.timeZone![4]) + (widget.timeZone![5]))) : 0;
    var date = DateTime.now();

    int time = hour.isNegative ? ((date.toUtc().hour + hour) % 24) : (date.toUtc().hour + hour) % 24;
    var now = DateTime(
      date.year,
      date.month,
      date.day,
      time,
      date.minute,
      date.second,
    );
    return DateFormat("H:m:s").format(now).toString();
  }

  void _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.maps!))) {
      throw 'Could not launch ${widget.maps}';
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(widget.coatOfArms);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            title: SizedBox(
                width: width * .7,
                child: Text(
                  widget.countryName!,
                  style: TextStyle(fontSize: 25),
                ))),
        body: ListView(
          children: <Widget>[
            Container(
              width: width,
              padding: const EdgeInsets.all(20),
              child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                return Text(
                  "${getSystemTime()}",
                  style: TextStyle(color: Color(0xff2d386b), fontSize: 50, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                );
              }),
            ),
            Text(
              'Current time',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            SvgPicture.network(
              widget.flagUrl!,
              width: width,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Flag of the country',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/icons/population.png',
              width: width,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Population  ${widget.population}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            SvgPicture.network(
              widget.coatOfArms!,
              width: width,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => _launchUrl(),
              child: Text('Country Location'),
            )
          ],
        ),
      ),
    );
  }
}
