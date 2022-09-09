import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note.dart';

class ErrorNoteCard extends StatelessWidget {
  const ErrorNoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.error,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(
              "Invalid note, please contact support",
              style: Theme.of(context).primaryTextTheme.bodyText2?.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Details for nerds:",
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            Text(
              note.failureOption.fold<String>(
                () => '',
                (f) => f.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
