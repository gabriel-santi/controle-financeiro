import 'package:finapp/features/language/interfaces/widgets/language_selector_widget.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/widget/button/next_button_widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(text: "Selecione o idioma:".hardcoded),
                  const Padding(padding: EdgeInsets.only(top: Sizes.p12)),
                  const Flexible(child: LanguageSelectorWidget()),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: NextButtonWidget(
        onClick: () {},
        isLoading: false,
        enabled: true,
      ),
    );
  }
}
