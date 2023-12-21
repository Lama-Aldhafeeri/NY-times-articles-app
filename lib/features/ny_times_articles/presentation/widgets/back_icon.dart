import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 78, 223, 208),
          borderRadius: BorderRadius.circular(10)),
      width: 30,
      height: 30,
      child: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }
}
