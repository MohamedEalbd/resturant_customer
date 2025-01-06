class ChatModel {
  final int id;
  final String message;
  final String name;
  final String image;
  final String date;
  final bool isMe;

  ChatModel({
    required this.id,
    required this.message,
    required this.image,
    required this.date,
    required this.isMe,
    required this.name,
  });
}
