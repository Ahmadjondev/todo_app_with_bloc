import 'package:flutter/material.dart';

import '../models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback restoreCallback;
  final VoidCallback editCallback;
  const PopupMenu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.task,
    required this.editCallback,
    required this.restoreCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: editCallback,
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit"),
                  ),
                  onTap: null,
                ),
                PopupMenuItem(
                  onTap: likeOrDislikeCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: task.isFavorite == false
                        ? const Icon(Icons.bookmark_add_outlined)
                        : const Icon(Icons.bookmark_remove),
                    label: task.isFavorite == false
                        ? const Text("Add to \nBookmark")
                        : const Text("Remove from \nBookmark"),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete),
                    label: const Text("Delete"),
                  ),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text("Restore"),
                  ),
                  onTap: restoreCallback,
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text("Delete Forever"),
                  ),
                ),
              ],
    );
  }
}
