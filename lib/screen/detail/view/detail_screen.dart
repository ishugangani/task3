import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/screen/home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    HomeProvider HP = Provider.of(context, listen: true);
    int? index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "${HP.dataList!.countriesStat[index].countryName}",
            style: TextStyle(letterSpacing: 2),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50,top: 70,bottom: 70),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Cases: ${HP.dataList!.countriesStat[index].cases}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Deaths: ${HP.dataList!.countriesStat[index].deaths}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Recovery: ${HP.dataList!.countriesStat[index].totalRecovered}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Serious/Critical Cases: ${HP.dataList!.countriesStat[index].seriousCritical}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Active Cases: ${HP.dataList!.countriesStat[index].activeCases}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Cases per million: ${HP.dataList!.countriesStat[index].totalCasesPer1MPopulation}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Deaths per million: ${HP.dataList!.countriesStat[index].deathsPer1MPopulation}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Total Tested: ${HP.dataList!.countriesStat[index].totalTests}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Test per million: ${HP.dataList!.countriesStat[index].testsPer1MPopulation}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
