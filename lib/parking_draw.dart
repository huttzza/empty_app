import 'package:flutter/material.dart';
import 'parking_model.dart';

List<Widget> drawSpaceList(List<Space> spaceList, BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  double width = screenSize.width;
  double height = screenSize.height;

  List<Widget> spaceIconList = [];

  for (int i = 0; i < spaceList.length; i++) {
    Widget car = Icon(Icons.directions_car_filled_outlined,
        color: Colors.white, size: width * 0.08);
    if (spaceList[i].isEmpty == true) {
      car = Icon(Icons.directions_car_filled,
          color: Theme.of(context).colorScheme.secondary, size: width * 0.08);
      car = Container(
        width: width * 0.04,
        height: height * 0.03,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.all(Radius.circular(2))),
      );
    }
    spaceIconList.add(car);
  }
  print(spaceIconList.length);
  return spaceIconList;
}
