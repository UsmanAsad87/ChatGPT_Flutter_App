import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt_flutter/constants/constants.dart';
import 'package:chatgpt_flutter/services/assets_manager.dart';
import 'package:chatgpt_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget(
      {Key? key,
      required this.chatMsg,
      required this.chatIndex,
      this.animate = false})
      : super(key: key);
  final String chatMsg;
  final int chatIndex;
  final bool animate;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  bool isLike = false;
  bool isDislike = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: widget.chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: widget.chatIndex == 0
                      ? TextWidget(
                          label: widget.chatMsg,
                          fontSize: 16,
                        )
                      : !widget.animate
                          ? TextWidget(
                              label: widget.chatMsg,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )
                          : DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                              child: AnimatedTextKit(
                                  repeatForever: false,
                                  isRepeatingAnimation: false,
                                  totalRepeatCount: 1,
                                  displayFullTextOnTap: true,
                                  animatedTexts: [
                                    TyperAnimatedText(widget.chatMsg.trim())
                                  ]),
                            ),
                ),
                widget.chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLike = !isLike;
                                if (isDislike) {
                                  isDislike = !isDislike;
                                }
                              });
                            },
                            child: Icon(
                              isLike
                                  ? Icons.thumb_up
                                  : Icons.thumb_up_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDislike = !isDislike;
                                if (isLike) {
                                  isLike = !isLike;
                                }
                              });
                            },
                            child: Icon(
                              isDislike
                                  ? Icons.thumb_down
                                  : Icons.thumb_down_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}
