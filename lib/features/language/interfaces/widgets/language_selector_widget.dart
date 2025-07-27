import 'package:finapp/features/language/domain/language.dart';
import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';

class LanguageSelectorWidget extends StatefulWidget {
  const LanguageSelectorWidget({super.key});

  @override
  State<LanguageSelectorWidget> createState() => _LanguageSelectorWidgetState();
}

class _LanguageSelectorWidgetState extends State<LanguageSelectorWidget> {
  Language? _langSelected;

  void _onSelect(Language lang) {
    setState(() {
      _langSelected = lang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: Language.values.length,
      separatorBuilder: (_, __) => gapH12,
      itemBuilder: (context, index) {
        final lang = Language.values[index];
        final selected = _langSelected == lang;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _onSelect(lang),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: selected
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.primary,
                        ],
                        stops: const [0.5, 1],
                      )
                    : null,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(selected ? .8 : .14),
                ),
              ),
              padding: const EdgeInsets.all(Sizes.p16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: lang.description),
                  Image.asset(
                    "assets/images/png/flags/${lang.languageCode}_flag.png",
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
