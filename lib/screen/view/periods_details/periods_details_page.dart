import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test/data/model/historycal_model/historycal_model.dart';

@RoutePage()
class PeriodsDetailsPage extends StatelessWidget {
  const PeriodsDetailsPage({super.key, required this.data});
  final HistoricalModel data;
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
