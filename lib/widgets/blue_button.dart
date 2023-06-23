import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton(
      {Key? key,
      required this.text,
      this.sizePaddingHorizontal,
      this.sizePaddingVertical = 10,
      required this.action})
      : super(key: key);

  final double? sizePaddingHorizontal;
  final double? sizePaddingVertical;
  final String text;
  final Function action;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: sizePaddingHorizontal != null
          ? size.width - sizePaddingHorizontal!
          : size.width - 60,
      decoration: BoxDecoration(
        boxShadow: [
          // BoxShadow(
          //   color: ColorsTheme.grey7,
          //   offset: Offset(0, 2),
          //   spreadRadius: 1,
          //   blurRadius: 1,
          // )
        ],
        borderRadius: BorderRadius.circular(6),
        color: Colors.transparent,
      ),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            action();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: sizePaddingVertical!,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    // ElevatedButton(
    //   onPressed: () {
    //     action();
    //   },
    //   child: Text(
    //     text,
    //     style: Theme.of(context).textTheme.headline3!.copyWith(
    //           color: Colors.white,
    //         ),
    //   ),
    //   style: ElevatedButton.styleFrom(
    //     padding: EdgeInsets.symmetric(
    //       vertical: sizePaddingVertical != null ? sizePaddingVertical! : 10.h,
    //     ),
    //     fixedSize: Size.fromWidth(sizePaddingHorizontal != null
    //         ? size.width - sizePaddingHorizontal!
    //         : size.width - 60.w),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    //     primary: ColorsTheme.mainA,
    //     elevation: 0.0,
    //     shadowColor: Colors.transparent,
    //   ),
    // );
  }
}
