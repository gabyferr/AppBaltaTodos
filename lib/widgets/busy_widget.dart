import 'package:flutter/material.dart';

class TDBusy extends StatelessWidget {
  final bool busy;
  final Widget child;

  TDBusy({
    this.busy = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : child;
  }
}
