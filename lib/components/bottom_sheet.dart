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
        decoration: const BoxDecoration(
          color: Color(0xFF2BB7E3),
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
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF351A87),
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
