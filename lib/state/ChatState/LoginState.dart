
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/ChatMessageEntity.dart';

final itemListProvider = StateProvider<List<ChatMessageEntity>>((ref)=> []);

class ChatState  {

  final List<ChatMessageEntity> messages = [
    ChatMessageEntity(text: "Hi", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
    ChatMessageEntity(text: "Hello", id: "2", createdAt: 123, author: Author(userName: "Mridha")),
    ChatMessageEntity(text: "How are you", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
    ChatMessageEntity(text: "I'm Fine and you?", id: "2", createdAt: 123, author: Author(userName: "Mridha")),
    ChatMessageEntity(text: "Hi", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
    ChatMessageEntity(text: "Hello", id: "2", createdAt: 123, author: Author(userName: "Mridha")),
    ChatMessageEntity(text: "How are you", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
    ChatMessageEntity(text: "I'm Fine and you?", id: "2", createdAt: 123, author: Author(userName: "Mridha")),
    ChatMessageEntity(text: "Hi", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
    ChatMessageEntity(text: "Hello", id: "2", createdAt: 123, author: Author(userName: "Mridha")),
    ChatMessageEntity(text: "How are you", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
    ChatMessageEntity(text: "I'm Fine and you?", id: "2", createdAt: 123, author: Author(userName: "Mridha")),
  ];
  void newMsg(ChatMessageEntity msg) {
    messages.add(msg);
    print("message: ${messages.length}");
  }
}
class ItemList extends StateNotifier<List<ChatMessageEntity>> {
  ItemList() : super([
    ChatMessageEntity(text: "Hi", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
    ChatMessageEntity(text: "Hello", id: "2", createdAt: 123, author: Author(userName: "Mridha")),
    ChatMessageEntity(text: "How are you", id: "1", createdAt: 123, author: Author(userName: "Mahbub")),
    ChatMessageEntity(text: "I'm Fine and you?", id: "2", createdAt: 123, author: Author(userName: "Mridha"))
  ]);

  static final provider = StateNotifierProvider<ItemList, List<ChatMessageEntity>>((ref) => ItemList());

  void addItem(ChatMessageEntity item) {
    state = [...state, item];
  }
}