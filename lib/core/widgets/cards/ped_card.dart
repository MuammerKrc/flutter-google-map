import 'package:flutter/material.dart';

class PedCard extends StatelessWidget {
  final String imageurl;
  final String title;
  final VoidCallback onPressed;

  const PedCard(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Card(
        child: ListTile(
          title: Text(title),
          leading: const Icon(Icons.abc_outlined),
          trailing: Image.network(imageurl),
        ),
      ),
    );
  }
}
