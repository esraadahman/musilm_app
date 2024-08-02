import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:qurana/features/chat/data/network/single_chatNetwork.dart';
import 'package:video_player/video_player.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  TextEditingController message = TextEditingController();

  String chat_id = "";

  set_chatid(String id) {
    chat_id = id;
  }

  sendMessage(String chatid, String massage, String type) {
    SingleChatNetwork.sendmassage(chatid, massage, type);
  }

  XFile? profilePic;
  XFile? video;

  sendimage(String chatid, XFile image) {
    SingleChatNetwork.takeAndUploadImage(chatid, image);
  }

  sendvideo(String chatid, XFile video) {
    SingleChatNetwork.uploadVideo(chatid, video);
  }

 getallmessages(String chatid) {
    SingleChatNetwork.getmassages(chatid);
  }

  getcurrentUserId() {
    SingleChatNetwork.getcurrentuserid();
  }






  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;


   void initializeVideo(String videoUrl) {
    videoPlayerController = VideoPlayerController.network(videoUrl);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      allowFullScreen: true,
      showControls: true,
    );
    emit(ChatVideoInitialized(videoPlayerController, chewieController));
  }

  void disposeVideo() {
    videoPlayerController.dispose();
    chewieController.dispose();
    emit(ChatVideoDisposed());
  }
}
