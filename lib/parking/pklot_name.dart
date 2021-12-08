import 'package:flutter/material.dart';

Widget pklot_name(context, name, address) {
  Size screenSize = MediaQuery.of(context).size;
  double width = screenSize.width;
  double height = screenSize.height;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //parking lot name
      SizedBox(
        width: width,
        height: height * 0.08,
        child: Container(
          child: Container(
            padding: EdgeInsets.all(height * 0.02),
            child: Text(
              name,
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
            address,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        ),
      ),
      SizedBox(
          height: height * 0.06,
          width: width,
          child: Text("pull to reload",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center)),
    ],
  );
}
