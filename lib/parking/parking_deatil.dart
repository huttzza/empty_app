import 'dart:convert';
import 'package:empty_app/parking/parking_model.dart';
import 'package:empty_app/parking/parking_draw.dart';
import 'package:empty_app/parking/pklot_json_example.dart';
import 'package:empty_app/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ParkingDetail extends StatefulWidget {
  ParkingDetail({Key? key}) : super(key: key);

  @override
  _ParkingDetailState createState() => _ParkingDetailState();
}

class _ParkingDetailState extends State<ParkingDetail> {
  //List<Space> spaceListAll = parseSpaces(jsonString);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    //List<Widget> spaceIconList = drawSpaceList(spaceListAll, context);

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
        body: FutureBuilder<List<Space>>(
            future: getSpaceListAll(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Space>? spaceListAll = snapshot.data;
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Column(
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
                                "Sogang Univ.",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor, //Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
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
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        Expanded(
                          child: ListView(
                            children: drawSpaceBox(spaceListAll!, context),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

Future<List<Space>> getSpaceListAll(context) async {
  List<Space> spaceListAll = [];
  try {
    final response = await http.get(
      Uri.parse(UrlPrefix.urls + "/test"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      spaceListAll = parseSpaces(response.body);
    }
  } catch (e) {
    print(e);
  }
  return spaceListAll;
}
