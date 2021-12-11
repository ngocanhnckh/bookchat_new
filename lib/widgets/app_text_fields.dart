import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final String floatingLabel;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final int maxLines;
  final int minLines;
  final String? label;
  final Color? fillColor;
  final Color? textColor;
  final Color? labelColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;

  const AppTextFormField({
    final Key? key,
    final this.floatingLabel = '',
    final this.validator,
    final this.onChanged,
    final this.onSaved,
    final this.obscureText,
    final this.suffixIcon,
    final this.prefixIcon,
    final this.keyboardType,
    final this.maxLines = 1,
    final this.minLines = 1,
    final this.label,
    this.fillColor,
    this.textColor,
    this.labelColor,
    this.inputFormatters,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      autofocus: autofocus,
      maxLines: maxLines,
      minLines: minLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: TextAlignVertical.top,
      style: TextStyle(color: textColor ?? theme.primaryColorDark.withOpacity(0.7), fontWeight: FontWeight.w600, fontSize: 15),
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: label,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(color: Color(0xFFBDBDBD)),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16)),
        fillColor: fillColor ?? const Color(0xFFF6F6F6),
        filled: true,
        // label: Text(floatingLabel),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    final Key? key,
    final this.floatingLabel,
    final this.onChanged,
    final this.onSaved,
    final this.label = 'Password',
  }) : super(key: key);

  final String? floatingLabel;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final String? label;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;

  @override
  Widget build(final BuildContext context) => AppTextFormField(
        label: widget.label,
        floatingLabel: widget.floatingLabel ?? '',
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        obscureText: !passwordVisible,
        keyboardType: TextInputType.visiblePassword,
        suffixIcon: IconButton(
          onPressed: () => setState(() => passwordVisible = !passwordVisible),
          icon: passwordVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
        ),
      );
}

class AppDropdownItem<T> {
  final String text;
  final T value;
  final bool enabled;
  const AppDropdownItem({
    required final this.text,
    required final this.value,
    final this.enabled = true,
  });
}

class AppDropdown<T> extends StatefulWidget {
  final List<AppDropdownItem<T>> items;
  final bool? Function(T)? onChangeItem;
  final T? intialSelected;
  final void Function(void Function(T))? changeSelection;
  final String placeholder;
  final String floatingLabel;
  const AppDropdown({
    required final this.items,
    final this.changeSelection,
    final Key? key,
    final this.onChangeItem,
    final this.intialSelected,
    final this.placeholder = '',
    final this.floatingLabel = '',
  }) : super(key: key);

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  late T? selectedItem = widget.intialSelected;
  @override
  void initState() {
    widget.changeSelection?.call((final T val) {
      setState(() {
        selectedItem = val;
      });
      widget.onChangeItem?.call(val);
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return DropdownButtonFormField<T>(
      onChanged: (final T? val) {
        if (val != null) {
          setState(() {
            selectedItem = val;
          });
          widget.onChangeItem?.call(val);
        }
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        fillColor: theme.backgroundColor,
        filled: true,
        label: widget.floatingLabel.isNotEmpty ? Text(widget.floatingLabel) : null,
      ),
      value: selectedItem,
      hint: widget.placeholder.isNotEmpty ? Text(widget.placeholder) : null,
      items: widget.items
          .map(
            (final AppDropdownItem<T> e) => DropdownMenuItem<T>(
              value: e.value,
              enabled: e.enabled,
              child: Text(e.text),
            ),
          )
          .toList(),
    );
  }
}
