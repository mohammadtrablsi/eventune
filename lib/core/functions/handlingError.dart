import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

custumErrorScreen() {
  return ErrorWidget.builder = (details) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            height: 200,
            width: 250,
            imageUrl:
                'https://www.incore.com/wp-content/uploads/2015/07/useless-404-error-pages.png',
            placeholder: (context, url) => const Icon(
              Icons.error,
              size: 60,
              color: Colors.black26,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              details.exception.toString(),
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  };
}
