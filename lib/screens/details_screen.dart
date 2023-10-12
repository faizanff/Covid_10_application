import 'package:covid_19_project/screens/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/reuseable_row_widget.dart';

class DetailsScreens extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailsScreens({
    super.key,
    required this.name,
    required this.image,
    required this.critical,
    required this.active,
    required this.test,
    required this.todayRecovered,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  @override
  State<DetailsScreens> createState() => _DetailsScreensState();
}

class _DetailsScreensState extends State<DetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        leading: IconButton(onPressed: (){Get.offAll(() => const CountriesList());}, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .06),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .06,),
                      ReusAbleRow(title: 'Total Cases',value: widget.totalCases.toString(),),
                      ReusAbleRow(title: 'Total Deaths',value: widget.totalDeaths.toString(),),
                      ReusAbleRow(title: 'Total Recovered',value: widget.totalRecovered.toString(),),
                      ReusAbleRow(title: 'Today Recovered',value: widget.todayRecovered.toString(),),
                      ReusAbleRow(title: 'Active',value: widget.active.toString(),),
                      ReusAbleRow(title: 'Tests',value: widget.test.toString(),),
                      ReusAbleRow(title: 'Critical',value: widget.critical.toString(),)
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
