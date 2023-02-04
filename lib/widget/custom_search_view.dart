import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'my_text.dart';

class CustomSearchView extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController controller;
  final bool hasText;
  final VoidCallback? onClearText;
  const CustomSearchView(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      required this.controller,
      this.hasText = false,
      this.onClearText})
      : super(key: key);

  @override
  State<CustomSearchView> createState() => _CustomSearchViewState();
}

class _CustomSearchViewState extends State<CustomSearchView> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_rounded),
        prefixIconConstraints: const BoxConstraints(minWidth: 32.0),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: colorPrimary, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
        suffix: widget.hasText
            ? InkWell(
                onTap: widget.onClearText,
                child: MyText(
                  text: "Clear",
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
