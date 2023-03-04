import 'package:flutter/material.dart';
import 'package:pics/models/photo.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image.network(
            photo.url,
            errorBuilder: (context, error, stackTrace) {
              print(error);
              return const Icon(Icons.error);
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(height: 10),
          Text(photo.title),
        ],
      ),
    );
  }
}
