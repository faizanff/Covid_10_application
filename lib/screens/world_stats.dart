import 'dart:async';
import 'package:covid_19_project/common_widgets/reuseable_row_widget.dart';
import 'package:covid_19_project/screens/countries_list.dart';
import 'package:covid_19_project/utilities/models/WorldStatsModel.dart';
import 'package:covid_19_project/utilities/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({super.key});

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        title: const Text("World Stats"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .01),
                FutureBuilder(future: statesServices.fetchWorldStatesRecords() , builder: (context, AsyncSnapshot<WorldStatsModel> snapshot){
                  if(!snapshot.hasData){
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.black,
                        size: 50.0,
                        controller: _controller,
                      ),
                    );
                  }
                  else{
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total" : double.parse(snapshot.data!.cases.toString()),
                            "Recovered": double.parse(snapshot.data!.recovered.toString()),
                            "Deaths": double.parse(snapshot.data!.deaths.toString()),
                          },
                          colorList: [Colors.blue, Colors.green, Colors.red,],
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          chartRadius: 150.0,
                          legendOptions: LegendOptions(legendPosition: LegendPosition.left),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              children: [
                                ReusAbleRow(title: "Total cases",value: snapshot.data!.cases.toString(),),
                                ReusAbleRow(title: "Deaths",value: snapshot.data!.deaths.toString(),),
                                ReusAbleRow(title: "Total Recovered",value: snapshot.data!.recovered.toString(),),
                                ReusAbleRow(title: "Active",value: snapshot.data!.active.toString(),),
                                ReusAbleRow(title: "Critical",value: snapshot.data!.critical.toString(),),
                                ReusAbleRow(title: "Today Deaths",value: snapshot.data!.todayDeaths.toString(),),
                                ReusAbleRow(title: "Today Recovered",value: snapshot.data!.todayRecovered.toString(),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(onPressed: (){Get.offAll(() => const CountriesList());}, child: Text("Track Countries"),)),
                      ],
                    );
                  }
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
