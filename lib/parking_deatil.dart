import 'package:empty_app/parking_model.dart';
import 'package:empty_app/parking_draw.dart';
import 'package:empty_app/pklot_json_example.dart';
import 'package:flutter/material.dart';

class ParkingDetail extends StatefulWidget {
  ParkingDetail({Key? key}) : super(key: key);

  @override
  _ParkingDetailState createState() => _ParkingDetailState();
}

class _ParkingDetailState extends State<ParkingDetail> {
  List<Space> spaceList = parseSpaces(jsonString);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    List<Widget> spaceIconList = drawSpaceList(spaceList, context);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ))
            ]),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //parking lot name
              SizedBox(
                width: width,
                height: height * 0.08,
                child: Container(
                  //color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.all(height * 0.02),
                    child: Text(
                      "Sogang Univ.",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor, //Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                ),
              ),
              //parking lot address
              SizedBox(
                height: height * 0.07,
                child: Container(
                  child: Text(
                    "35, Baekbeom-ro, Mapo-gu, Seoul",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              //parking lot icons
              Container(
                child: SizedBox(
                  width: width * 0.5,
                  height: height * 0.07,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          spaceIconList /*[
                        Icon(Icons.directions_car_filled,
                            color: Colors.white, size: height * 0.05),
                        Icon(Icons.directions_car_filled,
                            color: Colors.white, size: height * 0.05),
                        Icon(Icons.directions_car_filled,
                            color: Colors.white, size: height * 0.05),
                        Icon(Icons.directions_car_filled,
                            color: Colors.white, size: height * 0.05),
                      ]*/
                      ,
                    ),
                  ),
                ),
              ),
              //Icon(Icons.directions_car_filled) //directions_car_filled_outlined
            ],
          ),
        ));
  }
}
