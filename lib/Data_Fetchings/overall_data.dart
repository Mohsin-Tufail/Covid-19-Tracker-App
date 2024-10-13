import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_practice/Models/OverallDataModel.dart';
import 'package:api_practice/Services/all_urls.dart';

class Overall_Data{
  Future<OverallDataModel> Overall_Data_Fetching()async{
    final reponse = await http.get(Uri.parse(All_Urls.All_Url_var));

    if(reponse.statusCode==200){
      var data = jsonDecode(reponse.body);
      return OverallDataModel.fromJson(data);



    }else{
      throw Exception('Facing Error');
    }
    
}


}