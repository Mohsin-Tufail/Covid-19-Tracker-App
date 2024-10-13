import 'dart:convert';
import 'package:api_practice/Models/day6Model.dart';
import 'package:http/http.dart' as http;
import 'package:api_practice/Services/all_urls.dart';

class Countries_Data {

  List<Day6Model> Data_list = [];
  Future<List> Data_Fetching() async{

    final resp =await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));

    if(resp.statusCode == 200){
      var Data = jsonDecode(resp.body);
      for(Map i in Data){
        Data_list.add(Day6Model.fromJson(i));
      }
      return Data_list;



    }else{
      throw Exception('error Occour in feching data.');


    }


  }
}
