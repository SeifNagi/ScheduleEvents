import 'package:flutter/material.dart';
import '../../presentation/widgets/text.dart';

class ImageWithText extends StatelessWidget {
  final String? imagePath;
  final String textData;
  final Widget? widget;
  final style;
  const ImageWithText(
      {super.key,
      required this.textData,
      this.widget,
      this.imagePath,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                      'https://ik.imagekit.io/tnc8pizf9e/$imagePath?tr=w-25,h-25'))
              : Container(),
          CustomizedText(textcontent: textData, style: style),
          Container(
            child: widget,
          ),
        ],
      ),
    );
  }
}
