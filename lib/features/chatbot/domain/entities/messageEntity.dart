class MessageEntity {
  bool isUser;
  String message;
  bool? isFullyTyped;
  MessageEntity({
    required this.isUser,
    required this.message,
    this.isFullyTyped = false,
  });
}
