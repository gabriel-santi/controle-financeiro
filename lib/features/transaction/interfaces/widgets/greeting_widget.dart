import 'package:finapp/shared/extensions/localization.dart';
import 'package:finapp/shared/theme/theme.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  static int get durationGreetingAnimation => _delayTillUsernameAnimation + _durationUsernameAnimation;

  static int get _delayTillAnimation => 1200;

  static int get _durationSlideAnimation => 1000;

  static int get _delayTillUsernameAnimation => _delayTillAnimation + _durationSlideAnimation + 500;

  static int get _durationUsernameAnimation => 300;

  @override
  Widget build(BuildContext context) {
    const String user = "Username";
    return Stack(
      children: [
        Row(
          children: [
            TextWidget(
              text: context.translatedString.welcome,
              size: MainTheme.fontSizeSmall,
            ),
            TextWidget(
              text: '$user!',
              size: MainTheme.fontSizeMedium,
              weight: FontWeight.w500,
            )
                .animate(delay: Duration(milliseconds: _delayTillUsernameAnimation))
                .fadeIn(duration: Duration(milliseconds: _durationUsernameAnimation)),
          ],
        ),
        Container(
          width: 400,
          height: 24,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                MainTheme.lightTheme.surface.withOpacity(0),
                MainTheme.lightTheme.surface,
              ],
              stops: const [0.01, 0.06],
            ),
          ),
        )
            .animate(delay: Duration(milliseconds: _delayTillAnimation))
            .slideX(begin: -0.2, end: .4, duration: Duration(milliseconds: _durationSlideAnimation))
            .then()
            .fadeOut(duration: Duration.zero),
      ],
    );
  }
}
