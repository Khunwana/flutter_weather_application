import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  DateTime  date = DateTime.now();
  final GlobalController globalController =
    Get.put(GlobalController(),permanent: true);

  @override
  void initState(){
    getAddress(globalController.getLatitude().value
        ,globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat,lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat,lon);
    // print(placeMark);
    Placemark place = placeMark[0];
    setState(() {
      // city = place.locality!;
      city = place.locality! + "," + place.subLocality!;

    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left:20,right: 20),
          alignment: Alignment.topLeft,
          child: Text(
              city,
              style: const TextStyle(
                fontSize: 20,
                height: 2,
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left:20,right: 20,bottom: 10),
          alignment: Alignment.topLeft,
          child: Text(
            date.toLocal().toString(),
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                height: 1.5
            ),
          ),
        )
      ],
    );
  }
}
