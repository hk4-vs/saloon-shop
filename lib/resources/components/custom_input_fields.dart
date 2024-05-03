import 'package:flutter/material.dart';

class CustomInputFieldWidget extends StatefulWidget {
  final String fieldName;
  final String hindText;
  final Widget? icon;
  final Widget? prefix;
  final TextEditingController? controller;
  final bool isSecureText;
  final int maxLines;
  final Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  const CustomInputFieldWidget(
      {super.key,
      required this.fieldName,
      required this.hindText,
      this.controller,
      this.icon,
      this.isSecureText = false,
      this.prefix,
      this.maxLines = 1,
      this.validator,
      this.focusNode,
      this.onFieldSubmitted});

  @override
  State<CustomInputFieldWidget> createState() => _CustomInputFieldWidgetState();
}

class _CustomInputFieldWidgetState extends State<CustomInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: widget.controller ?? widget.controller,
          focusNode: widget.focusNode,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hindText,
            suffixIcon: widget.icon ?? widget.icon,
            prefix: widget.prefix ?? widget.prefix,
          ),
          validator: (value) => widget.validator!(value),
          obscureText: widget.isSecureText,
          onFieldSubmitted: widget.onFieldSubmitted,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        )
      ],
    );
  }
}
