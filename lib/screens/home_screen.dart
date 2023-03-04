import 'package:flutter/material.dart';
import 'package:pics/providers/photos.dart';
import 'package:pics/widgets/image_list.dart';
import 'package:provider/provider.dart';

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
      body: counter == 0
          ? const Center(
              child: Text('Press the button to see some images!'),
            )
          : const ImageList(),
    );
  }

  void fetchImage() async {
    counter += 1;
    await Provider.of<Photos>(context, listen: false).fetchOnePhoto(counter);
    setState(() {
      counter = counter;
    });
  }
}
