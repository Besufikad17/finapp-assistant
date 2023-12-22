import 'package:finappassistant/presentation/components/text.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.imgUrl,
    required this.name
  });

  final String imgUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Image.network(
            imgUrl,
            height: 60,
            width: 60,
          ),
        ),
        const SizedBox(width: 10),
        MyText(text: name, size: 16),
      ],
    );
  }
}