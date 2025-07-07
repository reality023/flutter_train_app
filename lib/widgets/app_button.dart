import 'package:flutter/material.dart';

enum ButtonVariant {
  primary,
  secondary,
  text,
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool fullWidth;
  final double? width;
  final double height;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.fullWidth = false,
    this.width,
    this.height = 50,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return _buildElevatedButton();
      case ButtonVariant.secondary:
        return _buildOutlinedButton();
      case ButtonVariant.text:
        return _buildTextButton();
    }
  }

  Widget _buildElevatedButton() {
    return SizedBox(
      width: fullWidth ? double.infinity : width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: textStyle ??
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildOutlinedButton() {
    return SizedBox(
      width: fullWidth ? double.infinity : width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.purple,
          side: const BorderSide(color: Colors.purple),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: textStyle ??
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildTextButton() {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.purple,
        textStyle: textStyle,
      ),
      child: Text(text),
    );
  }
}
