import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/ChatMessageEntity.dart';

// final itemListProvider = StateProvider<List<ChatMessageEntity>>((ref)=> []);
final List<ChatMessageEntity> messages = [
  ChatMessageEntity(
      text: "Hi", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
  ChatMessageEntity(text: "Hello",
      id: "2",
      createdAt: 123,
      author: Author(userName: "Mridha")),
  ChatMessageEntity(text: "How are you",
      id: "1",
      createdAt: 123,
      author: Author(userName: "Mahbub")),
  ChatMessageEntity(text: "I'm Fine and you?",
      id: "2",
      createdAt: 123,
      author: Author(userName: "Mridha")),
  ChatMessageEntity(
      text: "Hi", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
  ChatMessageEntity(text: "Hello",
      id: "2",
      createdAt: 123,
      author: Author(userName: "Mridha")),
  ChatMessageEntity(text: "How are you",
      id: "1",
      createdAt: 123,
      author: Author(userName: "Mahbub")),
  ChatMessageEntity(text: "I'm Fine and you?",
      id: "2",
      createdAt: 123,
      author: Author(userName: "Mridha")),
  ChatMessageEntity(
      text: "Hi", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
  ChatMessageEntity(text: "Hello",
      id: "2",
      createdAt: 123,
      author: Author(userName: "Mridha")),
  ChatMessageEntity(text: "How are you",
      id: "1",
      createdAt: 123,
      author: Author(userName: "Mahbub")),
  ChatMessageEntity(text: "I'm Fine and you?",
      id: "2",
      createdAt: 123,
      author: Author(userName: "Mridha")),
];

class ChatState {


  void newMsg(ChatMessageEntity msg) {
    messages.add(msg);
    print("message: ${messages.length}");
  }
}
// class ItemList extends StateNotifier<List<ChatMessageEntity>> {
//   ItemList() : super([
//     ChatMessageEntity(text: "Hi", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
//     ChatMessageEntity(text: "Hello", id: "2", createdAt: 123, author: Author(userName: "Mridha")),
//     ChatMessageEntity(text: "How are you", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
//     ChatMessageEntity(text: "I'm Fine and you?", id: "2", createdAt: 123, author: Author(userName: "Mridha"))
//   ]);
//
//   static final provider = StateNotifierProvider<ItemList, List<ChatMessageEntity>>((ref) => ItemList());
//
//   void addItem(ChatMessageEntity item) {
//     state = [...state, item];
//   }
// }

class ItemListNotifier extends StateNotifier<List<ChatMessageEntity>> {
  ItemListNotifier() :super(messages);

  void addItem(ChatMessageEntity item) {
    state = [...state, item];
  }
}

final itemListProvider = StateNotifierProvider((ref) => ItemListNotifier());

class ItemListChangeNotifier extends ChangeNotifier {
  final List<ChatMessageEntity> _messages = [];

  UnmodifiableListView<ChatMessageEntity> getMessages() => UnmodifiableListView(_messages);

  void addItem(ChatMessageEntity item) {
    _messages.add(item);
    notifyListeners();
  }
}

final itemListChangeProvider = ChangeNotifierProvider((ref) => ItemListChangeNotifier());