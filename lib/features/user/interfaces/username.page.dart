import 'package:finapp/shared/constants/app_sizes.dart';
import 'package:finapp/shared/extensions/string_extension.dart';
import 'package:finapp/shared/widget/button/next_button_widget.dart';
import 'package:finapp/shared/widget/input/text_input_widget.dart';
import 'package:finapp/shared/widget/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final TextEditingController _nameController = TextEditingController();
  final ValueNotifier<bool> _isValidName = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_verifyIsValidName);
  }

  void _verifyIsValidName() {
    _isValidName.value = _nameController.text.trim().isNotEmpty;
  }

  @override
  void dispose() {
    _isValidName.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ListenableBuilder(
          listenable: _isValidName,
          builder: (context, _) {
            return NextButtonWidget(
              onClick: () {},
              isLoading: false,
              enabled: _isValidName.value,
            );
          }),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            TextWidget(text: "Como gostaria de ser chamado?".hardcoded).animate(delay: const Duration(milliseconds: 800)).fadeIn(),
            gapH12,
            TextInputWidget(
              label: null,
              controller: _nameController,
              autofocus: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Preencha este campo'.hardcoded;
                }
                return null;
              },
            ).animate(delay: const Duration(milliseconds: 1600)).fadeIn(),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
