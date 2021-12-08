import 'dart:async';
import 'dart:convert';
import 'package:empty_app/parking/parking_model.dart';
import 'package:empty_app/parking/parking_draw.dart';
import 'package:empty_app/parking/pklot_name.dart';
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
  late Timer _timer;
  var _time = 0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _start() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _time++;
      if (_time == 30) {
        //정해진 초마다 갱신
        setState(() {
          print(_time);
          _reset();
        });
      }
    });
  }

  void _reset() {
    setState(() {
      _timer.cancel();
      _time = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    _start();
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    //List<Widget> spaceIconList = drawSpaceList(spaceListAll, context);
    var _time = 0;

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
            children: [
              //parking lot name
              pklot_name(
                  context, "Sogang Univ.", "35, Baekbeom-ro, Mapo-gu, Seoul"),

              Expanded(
                child: FutureBuilder<List<dynamic>>(
                    future: getSpaceListAll(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }

                      var data = snapshot.data;
                      List<Space>? spaceListAll = data![0];
                      //List<int>
                      var spaceStruct = data[1].cast<int>();

                      print(spaceListAll);
                      print(spaceStruct);
                      return RefreshIndicator(
                          onRefresh: () async {
                            setState(() {});
                          },
                          child: ListView(
                            children: drawSpaceBox(
                                context, spaceListAll!, spaceStruct),
                          ));
                    }),
              )
            ],
          ),
        ));
  }
}

Future<List<dynamic>> getSpaceListAll() async {
  List<Space> spaceListAll = [];
  List<int> spaceStruct = [];
  try {
    final response = await http.get(
      Uri.parse(UrlPrefix.urls + "video_predict"), //"test"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      spaceListAll = parseSpaces(data["area"]);
      print(spaceListAll);
      spaceStruct = data["table"].cast<int>();
    }
  } catch (e) {
    print(e);
  }
  return [spaceListAll, spaceStruct];
}
