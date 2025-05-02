import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definir un provider para manejar la lista de mensajes
final messageListProvider = StateNotifierProvider<MessageListNotifier, List<String>>((ref) {
  return MessageListNotifier();
});

// Definir un Notifier para gestionar la lista de mensajes
class MessageListNotifier extends StateNotifier<List<String>> {
  MessageListNotifier() : super([]);

  // Método para agregar un nuevo mensaje
  void addMessage(String message) {
    state = [message, ...state]; // Agrega el mensaje al principio de la lista
  }
}
