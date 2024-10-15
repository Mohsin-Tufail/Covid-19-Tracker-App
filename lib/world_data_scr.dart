import 'package:api_practice/Data_Fetchings/overall_data.dart';
import 'package:api_practice/Models/OverallDataModel.dart';
import 'package:api_practice/countries_data-scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldDataScr extends StatefulWidget {
  const WorldDataScr({super.key});

  @override
  State<WorldDataScr> createState() => _WorldDataScrState();
}

class _WorldDataScrState extends State<WorldDataScr>
    with TickerProviderStateMixin {
  @override
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();
  Overall_Data AllData = Overall_Data();

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Over all data is here '),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            FutureBuilder(
                future: AllData.Overall_Data_Fetching(),
                builder: (context, AsyncSnapshot<OverallDataModel> Snapshot) {
                  if (Snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: SpinKitFadingCircle(
                                            color: Colors.orange,
                                            controller: _controller,
                                          ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total": double.parse(Snapshot.data!.cases!.toString()),
                            "Recover": double.parse(Snapshot.data!.recovered!.toString()),
                            "Deaths": double.parse(Snapshot.data!.deaths.toString()),
                          },
                          chartType: ChartType.ring,
                          legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left),
                          chartRadius: 150,
                          animationDuration: Duration(milliseconds: 2000),
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Card(
                          child: Column(
                            children: [
                              Reuseable_Row(
                                  Name: "Cases",
                                  Value: Snapshot.data!.cases.toString()),
                              Reuseable_Row(
                                  Name: "Deaths",
                                  Value: Snapshot.data!.deaths.toString()),
                              Reuseable_Row(
                                  Name: "Active",
                                  Value: Snapshot.data!.active.toString()),
                              Reuseable_Row(
                                  Name: "Recovered",
                                  Value: Snapshot.data!.recovered.toString()),
                              Reuseable_Row(
                                  Name: "Critical",
                                  Value: Snapshot.data!.critical.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),


                        InkWell(
                          onTap :(){
                            Navigator
                                .push(context, MaterialPageRoute(builder: (context)=> CountriesData_scr()));
                          },

                          child: Container(

                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child:  Center(
                              child: Text(
                                "Track Countries",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    ));
  }
}

class Reuseable_Row extends StatelessWidget {
  Reuseable_Row({super.key, required this.Name, required this.Value});

  final String Name, Value;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Name),
                Text(Value),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider()
          ],
        ));
  }
}
