import 'package:animation_app/Model/Provider/Provider_data.dart';
import 'package:animation_app/UI/AimationList.dart';

import 'package:animation_app/test/page_three.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/SelectAnimation.dart';
import 'UI/Transform Animation/page_one.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>ProviderData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

        ),
        home:SelectAnimation(),
      ),

    );

  }
}


