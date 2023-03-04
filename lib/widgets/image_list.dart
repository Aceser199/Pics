import 'package:flutter/material.dart';
import 'package:pics/providers/photos.dart';
import 'package:pics/widgets/image_card.dart';
import 'package:provider/provider.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key});

  @override
  Widget build(BuildContext context) {
    final photos = Provider.of<Photos>(context, listen: true).photos;
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return ImageCard(photo: photos[index]);
      },
    );
  }
}
