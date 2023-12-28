import 'package:flutter/material.dart';
import 'package:wusla/components/mybutton.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: Container(
        height: 170,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // TextField with the provided TextEditingController
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter your text',
              ),
              controller: controller, // Use the provided controller
            ),

            const SizedBox(height: 16),

            // Buttons (Save and Cancel)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save button
                MyButton(
                  text: 'Save',
                  onPressed: onSave,
                ),

                const SizedBox(width: 10),

                // Cancel button
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
