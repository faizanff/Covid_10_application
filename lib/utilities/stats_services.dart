import 'dart:convert';

import 'package:covid_19_project/utilities/app_urls/app_urls.dart';
import 'package:flutter/material.dart';
import 'models/WorldStatsModel.dart';
import 'package:http/http.dart' as http;

class StatesServices{

  Future<WorldStatsModel> fetchWorldStatesRecords () async{

    final response = await http.get(Uri.parse(EndPoints.worldStatsApi));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }
  Future<List<dynamic>> countriesListApi () async{

    var data;
    final response = await http.get(Uri.parse(EndPoints.countriesList));
    if(response.statusCode == 200){

       data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception('Error');
    }
  }

}