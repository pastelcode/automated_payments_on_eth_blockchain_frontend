part of '../../pages/home_page.dart';

class _SignAndExecuteButton extends StatelessWidget {
  const _SignAndExecuteButton({
    required this.formKeyToValidate,
  });

  final GlobalKey<FormState> formKeyToValidate;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Button(
      onPressed: () {
        formKeyToValidate.currentState?.validate();
      },
      title: const Text(
        'Sign members and execute',
      ),
      isPrimary: true,
    );
  }
}
