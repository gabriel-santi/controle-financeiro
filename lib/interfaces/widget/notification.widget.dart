import 'dart:async';
import 'dart:collection';

import 'package:finapp/interfaces/theme/theme.dart';
import 'package:finapp/interfaces/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ignore_for_file: constant_identifier_names

GlobalKey<NotificationWidgetState> notificationKey = GlobalKey<NotificationWidgetState>();

void showNotification(String text, [NotificationType type = NotificationType.WARNING]) {
  notificationKey.currentState?.addNotification(text, type);
}

class NotificationWidget extends StatefulWidget {
  final Widget child;

  const NotificationWidget({super.key, required this.child});

  @override
  State<NotificationWidget> createState() => NotificationWidgetState();
}

class NotificationWidgetState extends State<NotificationWidget> with TickerProviderStateMixin {
  final ListQueue<CustomNotification> _notifications = ListQueue();
  AnimationController? _animationController;
  Timer? _timer;
  final Duration _notificationDuration = const Duration(seconds: 3);

  CustomNotification? get currentNotification => _notifications.isNotEmpty ? _notifications.first : null;

  void addNotification(String text, NotificationType type) {
    if (currentNotification != null && currentNotification!.message == text) return;

    setState(() {
      final CustomNotification notification = CustomNotification(message: text, type: type);
      _notifications.addLast(notification);
      if (_notifications.length == 1) _showNotification();
    });
  }

  void _showNotification() {
    if (_timer != null) _timer?.cancel();
    _animationController?.forward();
    _timer = Timer(_notificationDuration, () => _removeNotification());
  }

  void _removeNotification() async {
    if (_notifications.isNotEmpty) {
      _animationController?.reverse();
      await Future.delayed(
        const Duration(milliseconds: 350),
        () {
          if (_notifications.isNotEmpty) _notifications.removeFirst();
          setState(() {});
        },
      );
    }
    if (_notifications.isNotEmpty) _showNotification();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _notificationDuration);
  }

  Color get _notificationBackgroundColor {
    if (currentNotification?.type == NotificationType.SUCCESS) return Theme.of(context).colorScheme.inversePrimary;
    if (currentNotification?.type == NotificationType.ERROR) return Theme.of(context).colorScheme.error;
    return Theme.of(context).colorScheme.tertiary;
  }

  Widget get _iconNotification {
    Icon icon;
    switch (currentNotification?.type) {
      case NotificationType.SUCCESS:
        icon = const Icon(Icons.check, size: 18);
      case NotificationType.ERROR:
        icon = const Icon(Icons.warning_amber_rounded, size: 18);
      default:
        icon = const Icon(Icons.info_outline, size: 18);
    }

    return Container(
      padding: EdgeInsets.all(MainTheme.spacing / 2),
      decoration: BoxDecoration(color: _notificationBackgroundColor, shape: BoxShape.circle),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          clipBehavior: Clip.none,
          child: Stack(
            children: [
              widget.child,
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.all(MainTheme.spacing),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceTint,
                    borderRadius: BorderRadius.circular(MainTheme.radiusSmall),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.shadow.withOpacity(.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: MainTheme.spacing),
                      _iconNotification,
                      SizedBox(width: MainTheme.spacing),
                      Expanded(
                          child: TextWidget(
                        text: currentNotification?.message ?? '',
                        size: MainTheme.fontSizeSmall,
                        maxLines: 2,
                        weight: FontWeight.w500,
                      )),
                      SizedBox(width: MainTheme.spacing),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: _removeNotification,
                      ),
                    ],
                  ),
                )
                    .animate(
                      autoPlay: false,
                      controller: _animationController,
                    )
                    .fadeIn(duration: const Duration(milliseconds: 300))
                    .moveY(begin: -2, end: 0, duration: const Duration(milliseconds: 200)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNotification {
  final String message;
  final NotificationType type;

  const CustomNotification({required this.message, required this.type});
}

enum NotificationType {
  SUCCESS,
  ERROR,
  WARNING,
}
