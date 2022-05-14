import 'package:flutter/material.dart';

class InputV1B extends StatelessWidget {
  final Widget? icon;
  final Color? colorIcon;
  final bool? password;
  final TextInputType? type;
  final String? placeholder;
  final Color? colorFocusBorder;
  // final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? iconDerecha;

  const InputV1B({
    Key? key,
    this.icon,
    this.colorIcon,
    this.password,
    this.type,
    this.placeholder,
    this.colorFocusBorder,
    // this.controller,
    this.validator,
    this.onChanged,
    this.iconDerecha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      // controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
      keyboardType: type ?? TextInputType.text,
      autocorrect: false,
      obscureText: password ?? false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            )),
        hintText: placeholder ?? '',
        suffixIcon: iconDerecha,
        hintStyle: const TextStyle(color: Colors.black45),
        focusColor: Colors.amber,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: colorFocusBorder ?? Colors.black)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        prefixIcon: icon,
      ),
    );
  }
}
