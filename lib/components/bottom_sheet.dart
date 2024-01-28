import 'package:flutter/material.dart';
import 'package:wusla/components/mybutton.dart';

class BottomSheetContent extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const BottomSheetContent({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  double _bottomSheetHeight = 1000;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(40),
        height: _bottomSheetHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TextField with the provided TextEditingController
            TextField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.tertiary),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ), // Wider for focus
                ),
                contentPadding: const EdgeInsets.all(12),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                ),
                hintText: 'Enter your text',
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              controller: widget.controller, // Use the provided controller
            ),

            const SizedBox(height: 30),

            // Buttons (Save and Cancel)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Save button
                MyButton(
                  text: 'Save',
                  onPressed: () {
                    setState(() {
                      _bottomSheetHeight = 2000; // Reset height
                    });
                    widget.onSave();
                  },
                ),

                const SizedBox(width: 10),

                // Cancel button
                MyButton(
                  text: 'Cancel',
                  onPressed: () {
                    setState(() {
                      _bottomSheetHeight = 200; // Reset height
                    });
                    widget.onCancel();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
