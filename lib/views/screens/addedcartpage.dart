import 'package:flutter/material.dart';

class AdddedCartPage extends StatefulWidget {
  const AdddedCartPage({Key? key}) : super(key: key);

  @override
  State<AdddedCartPage> createState() => _AdddedCartPageState();
}

class _AdddedCartPageState extends State<AdddedCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Added Cart Page"),
      ),
      // body: GridView.builder(gridDelegate: , itemBuilder: itemBuilder),
    );
  }
}
