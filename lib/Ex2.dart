import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              label: "Travelling",
              icon: Icons.favorite,
              iconPosition: IconPosition.left,
              buttonType: ButtonType.primary,
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Skating",
              icon: Icons.audiotrack,
              iconPosition: IconPosition.right,
              buttonType: ButtonType.secondary,
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Disabled",
              icon: Icons.block,
              buttonType: ButtonType.disabled,
            ),
          ],
        ),
      ),
    ),
  ));
}


enum IconPosition { left, right }
enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  Color _getBackgroundColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.grey;
      case ButtonType.disabled:
        return Colors.black26;
    }
  }

  @override
  Widget build(BuildContext context) {
    final background = _getBackgroundColor(); 

    List<Widget> rowItems = iconPosition == IconPosition.left
        ? [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.white)),
          ]
        : [
            Text(label, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 8),
            Icon(icon, color: Colors.white),
          ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowItems,
      ),
    );
  }
}
