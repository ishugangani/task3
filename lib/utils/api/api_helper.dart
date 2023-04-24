import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task3/screen/home/modal/home_modal.dart';

class ApiHelper
{

  Future<DataModal> dataApi()
  async {
    String link = "https://corona-virus-world-and-india-data.p.rapidapi.com/api";
    Uri uri =Uri.parse(link);
    var response = await http.get(
      uri,
      headers: {
        'content-type':'application/octet-stream',
        'X-RapidAPI-Key':'a3fb13405cmsh10d932ab7bf9dd9p1987fajsn3815cc97ffa2',
        'X-RapidAPI-Host':'corona-virus-world-and-india-data.p.rapidapi.com',
      },
    );
    var json = jsonDecode(response.body);
    DataModal d1 = DataModal.fromJson(json);
    return d1;
  }
}