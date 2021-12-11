import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    final this.title,
    final this.left = const <Widget>[],
    final this.right = const <Widget>[],
    final Key? key,
    final this.body,
  })  : assert(title != null || body != null, 'Title and Body both cannot be null'),
        super(key: key);
  final String? title;
  final List<Widget> left;
  final List<Widget> right;
  final Widget? body;

  @override
  Widget build(final BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: mediaQuery.viewPadding.top),
      height: 56 + mediaQuery.viewPadding.top,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 6,
            color: Colors.black.withOpacity(0.161),
          ),
        ],
      ),
      child: title != null
          ? Row(
              children: <Widget>[
                Row(
                  children: left,
                ),
                Expanded(
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: right,
                ),
              ],
            )
          : body,
    );
  }
}
