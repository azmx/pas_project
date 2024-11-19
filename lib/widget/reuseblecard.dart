import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ReusableCard({
    Key? key,
    required this.leading,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850], 
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}

class ReusableDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ReusableDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(color: Colors.white)),
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.grey[850],
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text("Batal", style: TextStyle(color: Colors.grey)),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text("Hapus", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

class EmptyStateMessage extends StatelessWidget {
  final String message;

  const EmptyStateMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}