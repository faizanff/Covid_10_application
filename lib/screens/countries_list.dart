import 'package:covid_19_project/screens/details_screen.dart';
import 'package:covid_19_project/screens/world_stats.dart';
import 'package:covid_19_project/utilities/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries List'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const WorldStats());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        hintText: "Seach with country name",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statesServices.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    height: 70,
                                    width: 60,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                          );
                        });
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (searchController.text.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.offAll(() => DetailsScreens(
                                          name: snapshot.data![index]
                                              ['country'],
                                          image: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          totalCases: snapshot.data![index]
                                              ['cases'],
                                          totalRecovered: snapshot.data![index]
                                              ['recovered'],
                                          totalDeaths: snapshot.data![index]
                                              ['deaths'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          critical: snapshot.data![index]
                                              ['critical'],
                                          test: snapshot.data![index]['tests'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                        ));
                                  },
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                      height: 70,
                                      width: 60,
                                    ),
                                  ),
                                )
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.offAll(() => DetailsScreens(
                                      name: snapshot.data![index]
                                      ['country'],
                                      image: snapshot.data![index]
                                      ['countryInfo']['flag'],
                                      totalCases: snapshot.data![index]
                                      ['cases'],
                                      totalRecovered: snapshot.data![index]
                                      ['recovered'],
                                      totalDeaths: snapshot.data![index]
                                      ['deaths'],
                                      active: snapshot.data![index]
                                      ['active'],
                                      critical: snapshot.data![index]
                                      ['critical'],
                                      test: snapshot.data![index]['tests'],
                                      todayRecovered: snapshot.data![index]
                                      ['todayRecovered'],
                                    ));
                                  },
                                  child: ListTile(
                                    title: Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]['cases']
                                        .toString()),
                                    leading: Image(
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                      height: 70,
                                      width: 60,
                                    ),
                                  ),
                                )
                              ],
                            );
                          } else {
                            Container();
                          }
                          return null;
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
