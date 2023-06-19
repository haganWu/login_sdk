import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;

  const LoginButtonWidget({Key? key, required this.title, this.enable = true, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enable ? onPressed : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      height: 36,
      disabledColor: Colors.white60,
      color: Colors.blueGrey,
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
