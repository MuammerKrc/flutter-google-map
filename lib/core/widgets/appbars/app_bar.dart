import 'package:flutter/material.dart';

class AppBarWidgets extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() => _appBar();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class _appBar extends State<AppBarWidgets> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flight App'),
    );
  }
}
