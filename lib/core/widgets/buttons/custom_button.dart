import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final double height;
  final double? width;
  final bool isOutlined;
  final bool isFilled;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.btnName,
    this.width,
    this.height = 60.0,
    this.isFilled = true,
    this.isOutlined = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(buttonWidth, height),
        elevation: isOutlined ? 0 : 4,
        backgroundColor: isOutlined
            ? Colors.transparent
            : Theme.of(context).colorScheme.primary,
        foregroundColor: isOutlined
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary,
        side: isOutlined
            ? BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2.0,
              )
            : null,
      ),
      child: Text(
        btnName,
        style: width == null
            ? Theme.of(context).textTheme.titleMedium
            : Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
