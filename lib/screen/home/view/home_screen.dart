import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/screen/home/modal/home_modal.dart';
import 'package:task3/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    HomeProvider HP = Provider.of(context,listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Covid Cases",
            style: TextStyle(letterSpacing: 2),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
            else if(snapshot.hasData)
            {
              DataModal? dataModal = snapshot.data as DataModal?;
              List<CountriesStat> dataList= dataModal!.countriesStat;

              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text("${HP.dataList!.countriesStat[index].countryName}"),
                        subtitle: Text("${HP.dataList!.countriesStat[index].cases}"),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'detail', arguments: index);
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Container(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            );
          },
          future: HP.callApi(),
        ),
      ),
    );
  }
}
