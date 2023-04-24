import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/screen/detail/view/detail_screen.dart';
import 'package:task3/screen/home/provider/home_provider.dart';
import 'package:task3/screen/home/view/home_screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => HomeScreen(),
          "detail":(p0) => DetailScreen(),
        },
      ),
    ),
  );
}