import 'package:app_desafio/app/app.dart';
import 'package:app_desafio/view_model/employees_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmployeesViewModel()..fetchEmployees()),
      ],
      child: const MyApp(),
    ),
  );
}


