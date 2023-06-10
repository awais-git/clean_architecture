import 'package:flutter/material.dart';

extension ScollControllerExtension on ScrollController {
  void onScrollEndsListener(final void Function() callback,
      {double offet = 0}) {
    addListener(() {
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels - offset;

      if (currentScroll == maxScroll) {
        callback();
      }
    });
  }
}
