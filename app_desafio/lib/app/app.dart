import 'package:app_desafio/app/theme/appTheme.dart';
import 'package:app_desafio/app/view/employees_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeTelent Desafio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.instance.appTheme(context),
      home: const EmployeesView(),
    );
  }
}
