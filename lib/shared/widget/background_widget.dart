import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: Stack(
          children: [
            Positioned(
              bottom: -200,
              child: Container(
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary,
                      blurRadius: 130,
                      spreadRadius: 20,
                    )
                  ],
                ),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
