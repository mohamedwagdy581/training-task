import 'package:flutter/material.dart';

class QtyControl extends StatelessWidget {
  final int qty;
  final void Function()? incButton;
  final void Function()? decButton;
  const QtyControl({
    super.key,
    required this.qty,
    this.incButton,
    this.decButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: decButton,
            icon: const Icon(Icons.remove),
          ),
          Text(
            qty.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: incButton,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
