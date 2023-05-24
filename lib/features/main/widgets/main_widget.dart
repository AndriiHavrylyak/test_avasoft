import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/common/widgets/custom_button.dart';
import '../../../core/common/widgets/custom_form_text.dart';
import '../../../core/config/colorz.dart';
import '../../../core/config/dimens.dart';
import '../../../core/config/resources.dart';
import '../../../core/constants/titles.dart';
import '../managers/main_bloc.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  MainWidgetState createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  late FocusNode _ageFocus;
  late TextEditingController _ageController;

  @override
  void initState() {
    _ageFocus = FocusNode();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _ageFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              top: Margins.big, right: Margins.medium, left: Margins.medium),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(
                Img.logo,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTextField(
                      focusNode: _ageFocus,
                      errorText: '',
                      textEditingController: _ageController,
                      inputFormatter:
                          FilteringTextInputFormatter.singleLineFormatter,
                      keyboardType: TextInputType.number,
                      labelText: Titles.youAge,
                      borderColor: Colorz.accent,
                      onChanged: (age) =>
                          BlocProvider.of<MainBloc>(context).add(
                        AgeSubmitted(int.parse(age)),
                      ),
                    ),
                    const SizedBox(
                      height: Margins.medium,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: CustomElevatedButton(
                        isDark: true,
                        isEnabled: true,
                        onPressed: () {
                          BlocProvider.of<MainBloc>(context).add(
                            Submitted(),
                          );
                        },
                        child: const Text(
                          Titles.next,
                          style: TextStyle(
                            color: Colorz.white,
                            fontSize: FontSize.small,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget _buildTextField({
  bool enabled = true,
  required TextEditingController textEditingController,
  FocusNode? focusNode,
  required TextInputFormatter inputFormatter,
  required TextInputType keyboardType,
  required String labelText,
  required String? errorText,
  required Color borderColor,
  required ValueChanged<String> onChanged,
}) {
  if (errorText != null) {
    errorText = '';
  }
  return CustomFormFieldText(
    focusNode: focusNode,
    enabled: enabled,
    maxLength: 32,
    height: 60,
    controller: textEditingController,
    errorText: errorText,
    textInputType: keyboardType,
    inputFormatters: [inputFormatter],
    labelText: labelText,
    onChanged: onChanged,
  );
}
