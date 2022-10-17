import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String? photoPath;
  final double width;
  final double height;
  final BoxFit fit;
  const RoundedImage(
      {super.key,
      required this.photoPath,
      this.width = 25,
      this.height = 25,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: photoPath == null
          ? Image.network(
              'https://img.favpng.com/17/24/10/computer-icons-user-profile-male-avatar-png-favpng-jhVtWQQbMdbcNCahLZztCF5wk.jpg',
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            )
          : Image.network(
              'https://ik.imagekit.io/tnc8pizf9e/$photoPath?tr=w-$width,h-$height',
              fit: fit,
            ),
    );
  }
}
