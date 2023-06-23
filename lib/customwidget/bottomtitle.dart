import 'package:flutter/material.dart';

import '../const/style.dart';
import '../presntionlayer/auth/regeister.dart';

Widget drewBottomTitle({var leftText, rightText, context, final void Function()? onTapIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        InkWell(
          onTap: onTapIcon,
          child: Text(
            leftText,
            style: StyleApp.styleLogo,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          rightText,
          style: StyleApp.style2,
        ),
      ],
    ),
  );
}
