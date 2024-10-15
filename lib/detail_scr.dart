import 'package:api_practice/world_data_scr.dart';
import 'package:flutter/material.dart';

class DetailScr extends StatefulWidget {
  DetailScr({
    required this.Cases,
    required this.TodayCases,
    required this.Deaths,
    required this.todayDeaths,
    required this.recoverd,
    required this.critical,
    required this.Active,
    required this.Image,
    required this.C_name,
  });

  String Cases,
      TodayCases,
      Deaths,
      todayDeaths,
      recoverd,
      critical,
      Active,
      Image,
      C_name;

  @override
  State<DetailScr> createState() => _DetailScrState();
}

class _DetailScrState extends State<DetailScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.C_name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Card(
                  child: Column(
                    children: [
                      Reuseable_Row(Name: "Cases", Value: widget.Cases),
                      Reuseable_Row(
                          Name: "todayCases", Value: widget.todayDeaths),
                      Reuseable_Row(Name: "deaths", Value: widget.Deaths),
                      Reuseable_Row(
                          Name: "todayDeaths", Value: widget.TodayCases),
                      Reuseable_Row(Name: "recovered", Value: widget.recoverd),
                      Reuseable_Row(Name: "critical", Value: widget.critical),
                      Reuseable_Row(Name: "active", Value: widget.Active),
                    ],
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(widget.Image),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
