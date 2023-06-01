import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:superchat/state/ChatState/ChatState.dart';
import 'package:superchat/widgets/ChatInput.dart';
import 'package:superchat/widgets/ChatItem.dart';
import '../model/ChatMessageEntity.dart';



class ChatScreenState extends ConsumerWidget {

  final ScrollController _scrollController = ScrollController();
  bool _firstAutoscrollExecuted = false;
  bool _shouldAutoscroll = false;

  ChatScreenState({super.key});
  void _scrollToBottom() {
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.linear,
      duration: const Duration(seconds: 1),
    );
  }
  void _scrollListener() {
    _firstAutoscrollExecuted = true;

    if (_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _shouldAutoscroll = true;
    } else {
      _shouldAutoscroll = false;
    }
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    //chatState = ref.watch(ItemList.provider.notifier);
    final provider = ref.watch(itemListProvider.notifier);
    final list = ref.watch(itemListChangeProvider).getMessages();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Hi $username!',style: const TextStyle(color: Colors.black54),),
        actions: [
          IconButton(
              onPressed: () {
                //context.read<AuthService>().updateUserName("New Name!");
              },
              icon: const Icon(Icons.change_circle)),
          IconButton(
              onPressed: () {
                //context.read<AuthService>().logoutUser();
                Navigator.pushReplacementNamed(context, '/');
                print('Icon pressed!');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ChatItem(
                        alignment: list[index].author.userName ==
                            "Mahbub"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        entity:  list[index]);
                  })),
          ChatInput(
            onSubmit: (ChatMessageEntity msg){
              ref.watch(itemListChangeProvider).addItem(msg);
              if (_scrollController.hasClients && _shouldAutoscroll) {
                _scrollToBottom();
              }
              if (!_firstAutoscrollExecuted && _scrollController.hasClients) {
                _scrollToBottom();
              }
            }
          ),
        ],
      ),
    );
  }
}
