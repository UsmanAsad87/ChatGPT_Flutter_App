import 'package:chatgpt_flutter/constants/constants.dart';
import 'package:chatgpt_flutter/widgets/drop_down.dart';
import 'package:chatgpt_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';

class Services {
  static Future<void> showModalSheet(BuildContext context) async {
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                child: InkWell(
                  onTap: () {
                    final chatProv =
                        Provider.of<ChatProvider>(context, listen: false);
                    chatProv.clearChatList();
                  },
                  child: const Text(
                    "Clear History",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 5.0, bottom: 18, left: 18, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(top: 14.0,bottom: 14),
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
              ),
            ],
          );
        });
  }
}
