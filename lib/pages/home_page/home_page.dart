import 'package:flutter/material.dart';
import 'package:integration_practice/pages/home_page/widgets/custom_drawer.dart';
import 'package:integration_practice/pages/home_page/widgets/home_page_app_bar.dart';
import 'package:integration_practice/pages/home_page/widgets/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  void _incrementCounter() => _counter.value++;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(),
      drawer: const CustomDrawer(),
      body: ValueListenableBuilder(
        valueListenable: _counter,
        builder: (_, value, __) => HomePageBody(title: value.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
