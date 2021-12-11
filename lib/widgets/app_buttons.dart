import 'package:flutter/material.dart';
import 'package:book_chat/widgets/widgets.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required final this.onTap,
    final Key? key,
    final this.text,
    final this.disabled = false,
    final this.enabled = true,
    final this.loading = false,
    final this.color,
    final this.textColor,
    final this.padding = const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
    final this.fontSize,
    final this.builder,
  })  : assert(text != null || builder != null, 'Either text or builder must be passed'),
        super(key: key);

  final void Function() onTap;
  final String? text;
  final Widget Function(BuildContext, TextStyle)? builder;
  final bool disabled; // changes background to grey
  final bool enabled; // Just disables click
  final bool loading;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final double? fontSize;

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: disabled || loading ? theme.disabledColor : (color ?? theme.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: AppTouchable(
        onTap: !disabled && enabled && !loading ? onTap : null,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: padding,
          child: Center(
            child: loading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : builder != null
                    ? builder!(
                        context,
                        TextStyle(
                          color: disabled || loading ? Colors.white : color ?? theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize ?? 18,
                        ),
                      )
                    : Text(
                        text!,
                        style: TextStyle(
                          color: disabled || loading ? Colors.white : textColor ?? Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize ?? 18,
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}

class OutlineAppButton extends StatelessWidget {
  const OutlineAppButton({
    required final this.onTap,
    final Key? key,
    final this.text,
    final this.disabled = false,
    final this.enabled = true,
    final this.loading = false,
    final this.color,
    final this.textColor,
    final this.padding = const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
    final this.fontSize,
    final this.builder,
  })  : assert(text != null || builder != null, 'Either text or builder must be passed'),
        super(key: key);

  final void Function() onTap;
  final String? text;
  final Widget Function(BuildContext, TextStyle)? builder;
  final bool disabled; // changes background to grey
  final bool enabled; // Just disables click
  final bool loading;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final double? fontSize;

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: disabled || loading ? theme.disabledColor : color ?? theme.primaryColor),
        // color: disabled || loading ? theme.disabledColor : color,
        // gradient: disabled || loading ? null : const LinearGradient(colors: [Color(0xFF7ABFF9), Color(0xFF3D93DD)]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: AppTouchable(
        onTap: !disabled && enabled && !loading ? onTap : null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: padding,
          child: Center(
            child: loading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : builder != null
                    ? builder!(
                        context,
                        TextStyle(
                          color: disabled || loading ? theme.disabledColor : color ?? theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize ?? 18,
                        ),
                      )
                    : Text(
                        text!,
                        style: TextStyle(
                          color: disabled || loading ? theme.disabledColor : color ?? theme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize ?? 18,
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
