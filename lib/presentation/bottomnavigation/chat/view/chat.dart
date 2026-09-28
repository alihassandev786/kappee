import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/mediaquery.dart';
import '../controllers/chatcontroller.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // Safe GetX controller initialization to prevent controller disposed error
  late final ChatController controller;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<ChatController>()) {
      controller = Get.find<ChatController>();
    } else {
      controller = Get.put(ChatController(), permanent: true);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textcolor1,
            size: AppSize.width * 0.065,
          ),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thursday Football',
                  style: TextStyle(
                    fontSize: AppSize.width * 0.045,
                    fontFamily: "ps",
                    fontWeight: FontWeight.bold,
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(width: AppSize.width * 0.015),
                Text(
                  '⚽',
                  style: TextStyle(fontSize: AppSize.width * 0.04),
                ),
              ],
            ),
            SizedBox(height: AppSize.height * 0.002),
            Text(
              'Business Account',
              style: TextStyle(
                fontSize: AppSize.width * 0.028,
                fontFamily: "pr",
                fontWeight: FontWeight.w500,
                color: AppColors.textcolor2.withOpacity(0.7),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: AppColors.textcolor1,
              size: AppSize.width * 0.07,
            ),
          ),
          SizedBox(width: AppSize.width * 0.02),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Chat Messages List
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width * 0.04,
                    vertical: AppSize.height * 0.015,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final msg = controller.messages[index];
                    return _buildMessageBubble(
                      sender: msg['sender'],
                      message: msg['message'],
                      time: msg['time'],
                      isMe: msg['isMe'],
                      avatar: msg['avatar'],
                    );
                  },
                ),
              ),
            ),

            // 2. Bottom Text Input Field & Send Button Bar
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.width * 0.04,
                right: AppSize.width * 0.04,
                bottom: AppSize.height * 0.02,
                top: AppSize.height * 0.01,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width * 0.04,
                  vertical: AppSize.height * 0.006,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.messageController,
                        style: TextStyle(
                          fontSize: AppSize.width * 0.035,
                          fontFamily: "pr",
                          color: AppColors.textcolor1,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          hintStyle: TextStyle(
                            fontSize: AppSize.width * 0.033,
                            fontFamily: "pr",
                            color: AppColors.textcolor2,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: AppSize.height * 0.012,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSize.width * 0.02),
                    GestureDetector(
                      onTap: () => controller.sendMessage(),
                      child: CircleAvatar(
                        radius: AppSize.width * 0.052,
                        backgroundColor: AppColors.primary1,
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: AppSize.width * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Single Chat Message Bubble Widget
  Widget _buildMessageBubble({
    required String sender,
    required String message,
    required String time,
    required bool isMe,
    required String avatar,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.height * 0.02),
      child: isMe
          ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: AppSize.width * 0.72),
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width * 0.045,
              vertical: AppSize.height * 0.016,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary1,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: AppSize.width * 0.035,
                      fontFamily: "pr",
                      color: AppColors.background,
                      height: 1.3,
                    ),
                  ),
                ),
                if (time.isNotEmpty) ...[
                  SizedBox(width: AppSize.width * 0.03),
                  Row(
                    children: [
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: AppSize.width * 0.026,
                          fontFamily: "pr",
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(width: AppSize.width * 0.01),
                      Icon(
                        Icons.done_all,
                        size: AppSize.width * 0.038,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: AppSize.width * 0.05,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: AssetImage(
              avatar.isNotEmpty ? avatar : 'assets/images/profile.png',
            ),
            child: avatar.isEmpty
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          SizedBox(width: AppSize.width * 0.025),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(
                  fontSize: AppSize.width * 0.032,
                  fontFamily: "ps",
                  fontWeight: FontWeight.bold,
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.height * 0.005),
              Container(
                constraints: BoxConstraints(maxWidth: AppSize.width * 0.65),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width * 0.04,
                  vertical: AppSize.height * 0.015,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: AppSize.width * 0.034,
                          fontFamily: "pr",
                          color: AppColors.textcolor1,
                          height: 1.3,
                        ),
                      ),
                    ),
                    if (time.isNotEmpty) ...[
                      SizedBox(width: AppSize.width * 0.025),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: AppSize.width * 0.026,
                          fontFamily: "pr",
                          color: AppColors.textcolor2.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}