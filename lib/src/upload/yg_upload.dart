import 'package:flutter/material.dart';
import '../buttons/yg_button.dart';

class YGUpload extends StatefulWidget {
  final String? label;
  final String? hint;
  final bool multiple;
  final bool disabled;
  final List<String> accept;
  final ValueChanged<List<String>>? onChanged;
  final Widget? uploadButton;
  final double? maxWidth;
  final double? maxHeight;
  final bool showFileList;
  final bool draggable;

  const YGUpload({
    Key? key,
    this.label,
    this.hint,
    this.multiple = false,
    this.disabled = false,
    this.accept = const [],
    this.onChanged,
    this.uploadButton,
    this.maxWidth,
    this.maxHeight,
    this.showFileList = true,
    this.draggable = false,
  }) : super(key: key);

  @override
  State<YGUpload> createState() => _YGUploadState();
}

class _YGUploadState extends State<YGUpload> {
  final List<String> _files = [];
  bool _isDragging = false;

  void _handleUpload() {
    setState(() {
      _files.add('新文件 ${_files.length + 1}.pdf');
    });
    widget.onChanged?.call(_files);
  }

  void _removeFile(String file) {
    setState(() {
      _files.remove(file);
    });
    widget.onChanged?.call(_files);
  }

  @override
  Widget build(BuildContext context) {
    Widget uploadArea = widget.uploadButton ??
        YGButton(
          text: '点击上传',
          onPressed: widget.disabled ? null : _handleUpload,
          icon: const Icon(Icons.upload, size: 16),
        );

    if (widget.draggable) {
      uploadArea = Container(
        width: widget.maxWidth ?? double.infinity,
        height: widget.maxHeight ?? 150,
        decoration: BoxDecoration(
          color: _isDragging ? Colors.blue[50] : Colors.grey[50],
          border: Border.all(
            color: _isDragging ? Colors.blue : Colors.grey[300]!,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            // 拖拽区域
            Positioned.fill(
              child: DragTarget<String>(
                onWillAccept: (data) {
                  if (!widget.disabled) {
                    setState(() => _isDragging = true);
                    return true;
                  }
                  return false;
                },
                onAccept: (data) {
                  setState(() {
                    _isDragging = false;
                    _files.add(data);
                  });
                  widget.onChanged?.call(_files);
                },
                onLeave: (data) {
                  setState(() => _isDragging = false);
                },
                builder: (context, candidateData, rejectedData) {
                  return const SizedBox.expand();
                },
              ),
            ),
            // 内容展示
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.cloud_upload,
                    size: 48,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isDragging ? '松开以上传文件' : '将文件拖到此处，或',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  if (!_isDragging) ...[
                    const SizedBox(height: 8),
                    uploadArea,
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (!widget.draggable) uploadArea,
        if (widget.draggable) uploadArea,
        if (widget.hint != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.hint!,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
        if (widget.showFileList && _files.isNotEmpty) ...[
          const SizedBox(height: 16),
          Column(
            children: _files.map((file) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.insert_drive_file, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        file,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: () => _removeFile(file),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
