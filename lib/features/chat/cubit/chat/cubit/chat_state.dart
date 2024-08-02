part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}


class ChatVideoInitialized extends ChatState {
  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;

  ChatVideoInitialized(this.videoPlayerController, this.chewieController);
}

class ChatVideoDisposed extends ChatState {}
