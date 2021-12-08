import 'package:flutter/material.dart';
import 'parking_model.dart';

List<Widget> drawSpaceList(BuildContext context, List<Space> spaceList) {
  Size screenSize = MediaQuery.of(context).size;
  double width = screenSize.width;
  double height = screenSize.height;

  List<Widget> spaceIconList = [];

  for (int i = 0; i < spaceList.length; i++) {
    Widget car = Icon(Icons.directions_car_filled_outlined,
        color: Colors.white, size: width * 0.08);
    if (spaceList[i].isFull == false) {
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
  //print(spaceIconList.length);
  return spaceIconList;
}

List<Widget> drawSpaceBox(
    BuildContext context, List<Space> spaceListAll, List<int> spaceStruct) {
  Size screenSize = MediaQuery.of(context).size;
  double width = screenSize.width;
  double height = screenSize.height;

  //sort with x1
  //spaceListAll.sort((a, b) => a.x1.compareTo(b.x1));
  //print(spaceListAll);

  //일단 임의로 다섯 그룹으로만!! 0.0~0.2
  List<Widget> spaceBoxes = [];
  List<Space> tmp = [];
  //double point = 0.2;
  int structIdx = 0;

  if (spaceStruct.length == 0) {
    return [Container()];
  }

  for (int i = 0; i < spaceListAll.length; i++) {
    int index = spaceStruct[structIdx];
    if (structIdx != 0) index += spaceStruct[structIdx - 1];
    print("i $i index $index");
    if (i < index) {
      tmp.add(spaceListAll[i]);
    } else {
      //sort with y1
      //tmp.sort((a, b) => a.y1.compareTo(b.y1));
      //print(tmp);
      var spaceList = drawSpaceList(context, tmp);
      var box = Container(
        child: SizedBox(
          width: width,
          height: height * 0.07,
          child: Container(
            padding: EdgeInsets.all(spaceList.length.toDouble()),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: spaceList),
          ),
        ),
      );
      spaceBoxes.add(box);
      spaceBoxes.add(SizedBox(
        height: height * 0.01,
      ));

      tmp = [spaceListAll[i]];
      structIdx++;

      // point += 0.2;
    }
  }
  var spaceList = drawSpaceList(context, tmp);
  var box = Container(
    child: SizedBox(
      width: width,
      height: height * 0.07,
      child: Container(
        padding: EdgeInsets.all(spaceList.length.toDouble()),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: spaceList),
      ),
    ),
  );
  spaceBoxes.add(box);
  spaceBoxes.add(SizedBox(
    height: height * 0.01,
  ));
  return spaceBoxes;
}
