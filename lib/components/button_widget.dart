import 'package:flutter/material.dart';

class TDButton extends StatelessWidget {
  const TDButton(
      {Key? key,
      required this.text,
      this.image,
      required this.callback,
      this.width})
      : super(key: key);
  final String text;
  final String? image;
  final Function callback;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: width ?? 250,
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xFFfa4d73))),
        onPressed: () {
          callback();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Image.asset(
                    image!,
                    width: 32,
                  )
                : const SizedBox(),
            image != null
                ? const SizedBox(
                    width: 10,
                  )
                : const SizedBox(),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
