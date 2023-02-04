import 'package:chatgpt_flutter/constants/constants.dart';
import 'package:chatgpt_flutter/widgets/drop_down.dart';
import 'package:chatgpt_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Services {
  static Future<void> showModalSheet(BuildContext context) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextWidget(
                  label: "Chosen Model: ",
                  fontSize: 16,
                ),
                    )),
                Flexible(
                  flex: 2,
                  child: ModelsDropDownWidget(),
                )
              ],
            ),
          );
        });
  }
}
