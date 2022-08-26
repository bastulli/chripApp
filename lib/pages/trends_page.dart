import 'package:flutter/material.dart';
import 'package:chrip/charts/line_chart_1.dart';

import '../charts/pie_chart_1.dart';
import '../widgets/navigation_widget.dart';

class Trends extends StatefulWidget {
  String? userId;

  Trends({Key? key, this.userId}) : super(key: key);

  @override
  State<Trends> createState() => _TrendsState();
}

class _TrendsState extends State<Trends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(userId: widget.userId),
      appBar: AppBar(title: Center(child: const Text("T R E N D S"))),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: LineChartSample1(),
                  width: 450,
                  height: 400,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: PieChartSample3(),
                  width: 450,
                  height: 400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
