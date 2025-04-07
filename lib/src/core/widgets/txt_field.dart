import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/constants.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    this.controller,
    required this.hintText,
    this.number = false,
    this.multiline = false,
    this.readOnly = false,
    this.maxLength = 50,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController? controller;
  final String hintText;
  final bool number;
  final bool multiline;
  final bool readOnly;
  final int maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: number ? TextInputType.number : null,
      minLines: 1,
      maxLines: multiline ? 10 : 1,
      inputFormatters: [
        LengthLimitingTextInputFormatter(
          multiline ? maxLength : 25,
        ),
        if (number) FilteringTextInputFormatter.digitsOnly,
      ],
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: AppFonts.funnel400,
      ),
      decoration: InputDecoration(hintText: hintText),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
