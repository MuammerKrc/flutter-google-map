import 'package:flutter/material.dart';

class RowDivider extends StatelessWidget {
  final Color colors;
  final double indent;

  const RowDivider({super.key, required this.colors, required this.indent});
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: colors,
      indent: MediaQuery.of(context).size.width * indent,
      endIndent: MediaQuery.of(context).size.width * indent,
      thickness: 2,
    );
  }
}
