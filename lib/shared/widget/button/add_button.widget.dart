import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  final Function() onClick;

  const AddButtonWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: onClick,
      child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}
