import 'package:developer/tools/colors.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';

class MessageImgButtonWdgt extends StatelessWidget {
  final String? message;
  final String? imageUrl;
  final Widget? button;
  const MessageImgButtonWdgt(
      {Key? key, required this.message, required this.imageUrl, this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          FluxImage(
            imageUrl: imageUrl.toString(),
            width: 150,
            height: 150,
          ),
          SizedBox(height: 8),
          FittedBox(
            child: Text(
              message.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: kDarkAccent),
            ),
          ),
          SizedBox(height: 8),
          button ?? SizedBox(width: 1),
        ],
      ),
    );
  }
}
