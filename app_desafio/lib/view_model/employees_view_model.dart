import 'dart:convert';
import 'package:app_desafio/app/model/employees_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class EmployeesViewModel extends ChangeNotifier {
  List<EmployeeModel> _employees = [];
  List<EmployeeModel> get employees => _employees;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  Future<void> fetchEmployees() async {
    const String url = 'http://localhost:3000/employees';
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _employees = data.map((e) => EmployeeModel.fromJson(e)).toList();
      } else {
        throw Exception('Erro ao carregar funcionários');
      }
    } catch (e) {
      debugPrint('Erro ao buscar funcionários: $e');
    } finally {
      Future.delayed(const Duration(seconds: 1));
      _isLoading = false;
      notifyListeners();
    }
  }

  // Método para filtrar funcionários
  List<EmployeeModel> get filteredEmployees {
    final lowerQuery = _searchQuery.toLowerCase();

    return _employees.where((employee) {
      final matchesName = employee.name.toLowerCase().contains(lowerQuery);
      final matchesJob = employee.job.toLowerCase().contains(lowerQuery);
      final matchesPhone = employee.phone.contains(_searchQuery);

      return matchesName || matchesJob || matchesPhone;
    }).toList();
  }

  String formatPhoneNumber(String rawNumber) {
    final countryCode = rawNumber.substring(0, 2);
    final areaCode = rawNumber.substring(2, 4);
    final firstPart = rawNumber.substring(4, 9);
    final secondPart = rawNumber.substring(9);

    return '+$countryCode ($areaCode) $firstPart-$secondPart';
  }

  String formatDate(String rawDate) {
    final dateFormatter = DateFormat('dd/MM/yyyy');
    return dateFormatter.format(DateTime.parse(rawDate));
  }
}
