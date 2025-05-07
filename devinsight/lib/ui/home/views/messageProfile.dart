import 'package:devinsight/config/routers/app_router.dart';
import 'package:devinsight/ui/home/widgets/optionsDialog.dart';
import 'package:devinsight/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devinsight/config/providers/message_provider.dart';

class MessageProfile extends ConsumerWidget {
  const MessageProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageList = ref.watch(messageListProvider);
    final textController = TextEditingController();

    void sendMessage() {
      final message = textController.text.trim();
      if (message.isNotEmpty) {
        ref.read(messageListProvider.notifier).addMessage(message);
        textController.clear();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.secondaryColors,
      appBar: _buildAppBar(context, ref),
      body: Column(
        children: [
          _buildMessageList(messageList),
          _buildMessageInput(textController, sendMessage),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => ref.read(appRouterProvider).go(AppRouter.initial),
      ),
      elevation: 1,
      backgroundColor: AppColors.primaryColors,
      title: const CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage(
            'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/e40b6ea6361a1abe28f32e7910f63b66/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg'),
        backgroundColor: Colors.transparent,
      ),
      centerTitle: true,
    );
  }

  Expanded _buildMessageList(List<String> messageList) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          final message = messageList[index];
          return _buildMessageBubble(message);
        },
      ),
    );
  }

  Padding _buildMessageBubble(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }

  Padding _buildMessageInput(
      TextEditingController textController, VoidCallback sendMessage) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  color: AppColors.accent,
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                hintText: "Escribe un mensaje...",
                hintStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
