import 'package:flutter/material.dart';

cardQuestionMarkImage() {
  return const Center(
    child: Image(
      height: 100,
      fit: BoxFit.contain,
      image: NetworkImage(
          "https://media.istockphoto.com/photos/question-mark-3d-red-interrogation-point-asking-sign-punctuation-mark-picture-id1023347350?k=20&m=1023347350&s=612x612&w=0&h=VogcQy0SJJYgV_TItvoIRowOCR93tuCmO9o3AY-_mCg="),
    ),
  );
}
