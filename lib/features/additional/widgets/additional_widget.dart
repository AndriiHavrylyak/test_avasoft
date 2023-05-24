import 'package:flutter/material.dart';
import 'package:test_for_avasoft/core/config/dimens.dart';

class AdditionalWidget extends StatelessWidget {
  final String message;

  const AdditionalWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(Margins.medium),
        child: Text(
          message,
          style: const TextStyle(fontSize: 24),
          maxLines: 4,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
