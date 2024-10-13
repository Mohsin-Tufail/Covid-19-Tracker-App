import 'package:api_practice/Data_Fetchings/countries_data.dart';
import 'package:api_practice/Models/day6Model.dart';
import 'package:api_practice/detail_scr.dart';
import 'package:api_practice/splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class CountriesData_scr extends StatefulWidget {
  const CountriesData_scr({super.key});

  @override
  State<CountriesData_scr> createState() => _CountriesData_scrState();
}

TextEditingController SearchController = TextEditingController();



class _CountriesData_scrState extends State<CountriesData_scr> {
  Countries_Data countries_data = Countries_Data();
  @override
  void initState() {
    // TODO: implement initState

    SearchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Countries Data Screen'),
          ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: SearchController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.orange)),
                    hintText: 'Search with country name',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.orange,
                    ),
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.normal),
                  )),
            ),
            FutureBuilder(
              future: countries_data.Data_Fetching(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.maxFinite,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.black,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 30,
                                width: 40,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              title: Container(
                                height: 15,
                                width: 5,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              subtitle: Container(
                                height: 15,
                                width: 100,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data found'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index].country;
                          if (SearchController.text.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap : (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScr(
                                        Cases: snapshot.data![index].cases.toString(),
                                        TodayCases: snapshot.data![index].todayCases.toString(),
                                        Deaths: snapshot.data![index].deaths.toString(),
                                        todayDeaths: snapshot.data![index].todayDeaths.toString(),
                                        recoverd: snapshot.data![index].recovered.toString(),
                                        critical: snapshot.data![index].critical.toString(),
                                        Active:snapshot.data![index].active.toString(),
                                        Image: snapshot.data![index].countryInfo.flag,
                                        C_name: snapshot.data![index].country)));


                            },
                                  child: ListTile(
                                    leading: Container(

                                        height: 30,
                                        width: 40,
                                        child: Image(
                                            image: NetworkImage(snapshot
                                                .data![index].countryInfo.flag))),
                                    title: Text(snapshot.data![index].country),
                                    subtitle: Text(
                                        snapshot.data![index].cases.toString()),
                                  ),
                                )
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(SearchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap : (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScr(
                                        Cases: snapshot.data![index].cases.toString(),
                                        TodayCases: snapshot.data![index].todayCases.toString(),
                                        Deaths: snapshot.data![index].deaths.toString(),
                                        todayDeaths: snapshot.data![index].todayDeaths.toString(),
                                        recoverd: snapshot.data![index].recovered.toString(),
                                        critical: snapshot.data![index].critical.toString(),
                                        Active:snapshot.data![index].active.toString(),
                                        Image: snapshot.data![index].countryInfo.flag,
                                        C_name: snapshot.data![index].country)));


                                  },
                                  child: ListTile(
                                    leading: Container(
                                        height: 30,
                                        width: 40,
                                        child: Image(
                                            image: NetworkImage(snapshot
                                                .data![index].countryInfo.flag))),
                                    title: Text(snapshot.data![index].country),
                                    subtitle: Text(
                                        snapshot.data![index].cases.toString()),
                                  ),
                                )
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
