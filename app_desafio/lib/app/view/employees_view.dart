import 'package:app_desafio/app/theme/color_theme.dart';
import 'package:app_desafio/app/theme/spacing.dart';
import 'package:app_desafio/app/view/splash_screen.dart';
import 'package:app_desafio/app/widgets/build_row.dart';
import 'package:app_desafio/app/widgets/dotted_line.dart';
import 'package:app_desafio/view_model/employees_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EmployeesViewModel>();

    if (viewModel.isLoading) {
      return const SplashScreen(); // Tela de carregamento
    }

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/BeTalent.svg',
          colorFilter: const ColorFilter.mode(
            Color(0XFF222222), // Nova cor
            BlendMode.srcIn,
          ),
          width: 72,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: Spacing.spacingRegular2, right: Spacing.spacingRegular2, bottom: Spacing.spacingMedium2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Funcionários",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => viewModel.searchQuery = value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Pesquisar",
                filled: true,
                fillColor: ColorTheme.gray05,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xffEDEFFB),
                  border: Border.all(width: 1.0, color: ColorTheme.gray10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          Text('Foto',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 24),
                          Text('Nome',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 40), // Espaço para o ícone de ação
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 21),
                      child: Icon(Icons.circle, size: 8),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.filteredEmployees.length,
                itemBuilder: (context, index) {
                  final employee = viewModel.filteredEmployees[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: ColorTheme.gray10),
                    ),
                    child: ExpansionTile(
                      iconColor: ColorTheme.primary,
                      collapsedIconColor: ColorTheme.primary,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                      minTileHeight: 47,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(employee.image),
                      ),
                      title: Text(employee.name),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 32, left: 16, right: 23),
                          child: Column(
                            children: [
                              BuildRow(label: "Cargo:", value: employee.job),
                              const DottedLine(
                                color: ColorTheme.gray10,
                                dashWidth: 4.0,
                                dashSpacing: 4.0,
                                height: 1.0,
                              ),
                              const SizedBox(
                                height: Spacing.spacingRegular3,
                              ),
                              BuildRow(
                                label: "Admissão:",
                                value: viewModel
                                    .formatDate(employee.admissionDate),
                              ),
                              const DottedLine(
                                color: ColorTheme.gray10,
                                dashWidth: 4.0,
                                dashSpacing: 4.0,
                                height: 1.0,
                              ),
                              const SizedBox(
                                height: Spacing.spacingRegular3,
                              ),
                              BuildRow(
                                label: "Telefone:",
                                value:
                                    viewModel.formatPhoneNumber(employee.phone),
                              ),
                              const DottedLine(
                                color: ColorTheme.gray10,
                                dashWidth: 4.0,
                                dashSpacing: 4.0,
                                height: 1.0,
                              ),
                              const SizedBox(
                                height: Spacing.spacingRegular3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
