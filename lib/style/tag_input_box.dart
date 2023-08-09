import 'package:flutter/material.dart';

class TagBox extends StatefulWidget {

  final Function(List<String>) onTagsUpdate;

  const TagBox({Key? key, required this.onTagsUpdate}) : super(key: key);

  @override
  State<TagBox> createState() => _TagBoxState();
}

class _TagBoxState extends State<TagBox> {

  List<String> tags = [];
  TextEditingController _textEditingController = TextEditingController();

  void _addTag() {
    String tag = _textEditingController.text.trim();
    if (tag.isNotEmpty) {
      setState(() {
        tags.add(tag);
        _textEditingController.clear();
        widget.onTagsUpdate(tags);
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      tags.remove(tag);
      widget.onTagsUpdate(tags);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          children: tags.map((tag) => _buildTagChip(tag)).toList(),
        ),
        TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: 'Enter a tag',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (_) => _addTag(),
        ),
      ],
    );
  }

  Widget _buildTagChip(String tag) {
    return GestureDetector(
      onTap: () => _removeTag(tag),
      child: Chip(label: Text(tag)),
    );
  }

}
