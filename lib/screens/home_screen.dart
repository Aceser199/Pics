import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Let\'s see some images!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text('$counter no images found!'),
      ),
    );
  }

  void fetchImage() {
    setState(() {
      counter++;
    });
  }
}
