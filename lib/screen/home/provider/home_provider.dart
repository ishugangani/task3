
import 'package:flutter/material.dart';
import 'package:task3/screen/home/modal/home_modal.dart';
import 'package:task3/utils/api/api_helper.dart';

class HomeProvider extends ChangeNotifier
{
  DataModal? dataList;

  Future<DataModal?> callApi()
  async {
    ApiHelper a1 = ApiHelper();
    dataList=await a1.dataApi();
    notifyListeners();
    return dataList;
  }

}