import 'package:flutter/material.dart';


class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key, required this.onGenderSelected});
  final Function(String) onGenderSelected;

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  String _gender = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: [
            RadioMenuButton(
              value: "male",
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value.toString();
                  widget.onGenderSelected.call(_gender);
                });
              },
              child: const Text("Male"),
            ),
            RadioMenuButton(
              value: "female",
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value.toString();
                  widget.onGenderSelected.call(_gender);
                });
              },
              child: const Text("Female"),
            ),
            RadioMenuButton(
              value: "others",
              groupValue: _gender, 
              onChanged: (value) {
                setState(() {
                  _gender = value.toString();
                  widget.onGenderSelected.call(_gender);
                });
              },
              child: const Text("Others"),
            ),
          ],
        ),
      ],
    );
  }



}
