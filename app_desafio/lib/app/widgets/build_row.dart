import 'package:flutter/material.dart';

class BuildRow extends StatelessWidget {
  final String label;
  final String value;

  const BuildRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.headlineMedium),
        Text(value, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
