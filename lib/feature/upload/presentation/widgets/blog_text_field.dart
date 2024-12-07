import 'package:flutter/material.dart';

class BlogTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int minLines;
  const BlogTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      minLines: minLines,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
