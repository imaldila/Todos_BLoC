import 'package:flutter/material.dart';

import '../../../components.dart';

// ignore: must_be_immutable
class InputForm extends StatelessWidget {
  InputForm({Key? key, required this.title, required this.controller})
      : super(key: key);

  final String title;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kTextStyle,
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 8),
          width: double.infinity,
          child: TextFormField(
            controller: controller,
          ),
        )
      ],
    );
  }
}
