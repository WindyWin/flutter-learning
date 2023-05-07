//loading snackbar
import 'package:flutter/material.dart';

const double snackbarGap = 10;

class LoadingSnackBar extends SnackBar {
  final String contentMessage;
  int timeout;
  LoadingSnackBar(
      {required this.contentMessage, this.timeout = 600000, super.key})
      : super(
          duration: Duration(milliseconds: timeout),
          content: Row(
            children: [
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
              const SizedBox(
                width: snackbarGap,
              ),
              Text(contentMessage)
            ],
          ),
          backgroundColor: Colors.cyan.withOpacity(0.8),
        );
}

// class Error snackbar
class ErrorSnackBar extends SnackBar {
  final String contentMessage;
  final int timeout;
  ErrorSnackBar({required this.contentMessage, this.timeout = 400, super.key})
      : super(
          duration: Duration(milliseconds: timeout),
          content: Row(
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
              ),
              const SizedBox(
                width: snackbarGap,
              ),
              Text(contentMessage)
            ],
          ),
          backgroundColor: Colors.red.withOpacity(0.8),
        );
}

class SuccessSnackBar extends SnackBar {
  final String contentMessage;
  final int timeout;
  SuccessSnackBar({required this.contentMessage, this.timeout = 400, super.key})
      : super(
          duration: Duration(milliseconds: timeout),
          content: Row(
            children: [
              const Icon(
                Icons.check,
                color: Colors.white,
              ),
              const SizedBox(
                width: snackbarGap,
              ),
              Text(contentMessage)
            ],
          ),
          backgroundColor: Colors.green.withOpacity(0.8),
        );
}
