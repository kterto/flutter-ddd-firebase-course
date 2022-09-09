import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  const CriticalFailureDisplay({
    Key? key,
    required this.failure,
  }) : super(key: key);

  final NoteFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '😱',
            style: TextStyle(
              fontSize: 100,
            ),
          ),
          Text(
            failure.maybeMap(
              orElse: () => "UnexpectedError. \nPlease, contact support",
              insufficientPersmission: (_) => "Insufficient permissions",
            ),
            style: const TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton.icon(
            onPressed: () {
              print("Sending email...");
            },
            icon: const Icon(Icons.mail),
            label: const Text("I NEED HELP"),
          ),
        ],
      ),
    );
  }
}
