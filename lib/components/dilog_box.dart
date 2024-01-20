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
      contentPadding: EdgeInsets.all(20),
      backgroundColor: Color(0xFF351A87),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Container(
        height: 200,
        width: 900,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // TextField with the provided TextEditingController
            TextField(
              style: const TextStyle(
                  color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF2BB7E3),
                    width: 2,
                  ), // Wider for focus
                ),
                contentPadding: const EdgeInsets.all(12),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                hintText: 'Enter your text',
                hintStyle: const TextStyle(color: Colors.white),
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
