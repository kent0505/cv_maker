import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/config/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/txt_field.dart';
import 'field_title.dart';

class ExportSheet extends StatefulWidget {
  const ExportSheet({super.key, required this.screenshotController});

  final ScreenshotController screenshotController;

  static void show(
    BuildContext context, {
    required ScreenshotController screenshotController,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return ExportSheet(
          screenshotController: screenshotController,
        );
      },
    );
  }

  @override
  State<ExportSheet> createState() => _ExportSheetState();
}

class _ExportSheetState extends State<ExportSheet> {
  final filenameController = TextEditingController();
  String format = FileFormats.jpg;
  bool loading = false;

  void onFormat(String value) {
    setState(() {
      format = value;
    });
  }

  void onLoading(bool value) {
    if (mounted) {
      setState(() {
        loading = value;
      });
    }
  }

  void onShare() async {
    onLoading(true);

    try {
      Uint8List? imageBytes = await widget.screenshotController.capture();

      if (imageBytes == null) throw Exception();

      final dir = await getTemporaryDirectory();

      final filename =
          filenameController.text.isEmpty ? 'resume' : filenameController.text;

      late File file;

      if (format == FileFormats.pdf) {
        final pdf = pw.Document();
        final image = pw.MemoryImage(imageBytes);

        pdf.addPage(
          pw.Page(
            margin: pw.EdgeInsets.zero,
            pageFormat: PdfPageFormat.a4,
            build: (context) {
              return pw.Center(
                child: pw.Image(image, fit: pw.BoxFit.contain),
              );
            },
          ),
        );

        final bytes = await pdf.save();
        file = File('${dir.path}/$filename.pdf');
        await file.writeAsBytes(bytes);
      } else if (format == FileFormats.jpg || format == FileFormats.png) {
        file = File('${dir.path}/$filename.$format');
        await file.writeAsBytes(imageBytes);
      } else {
        throw Exception('Unsupported format');
      }

      onLoading(false);

      await Share.shareXFiles(
        [XFile(file.path)],
        sharePositionOrigin: Rect.fromLTWH(100, 100, 200, 200),
      );
    } catch (e) {
      logger(e);

      if (mounted) {
        onLoading(false);

        final l = AppLocalizations.of(context)!;

        DialogWidget.show(
          context,
          title: l.error,
          description: '',
          info: true,
          onYes: () {},
        );
      }
    }
  }

  @override
  void dispose() {
    filenameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: Bg(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: loading
              ? const LoadingWidget()
              : Column(
                  children: [
                    FieldTitle(l.fileName),
                    TxtField(
                      controller: filenameController,
                      hintText: 'resume',
                      maxLength: 20,
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(l.format),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        _Format(
                          title: FileFormats.jpg,
                          current: format,
                          onPressed: onFormat,
                        ),
                        const SizedBox(width: 8),
                        _Format(
                          title: FileFormats.png,
                          current: format,
                          onPressed: onFormat,
                        ),
                        const SizedBox(width: 8),
                        _Format(
                          title: FileFormats.pdf,
                          current: format,
                          onPressed: onFormat,
                        ),
                      ],
                    ),
                    Spacer(),
                    // MainButton(
                    //   title: 'Download',
                    //   horizontal: 0,
                    //   onPressed: () {},
                    // ),
                    // const SizedBox(height: 8),
                    MainButton(
                      title: l.share,
                      horizontal: 0,
                      onPressed: onShare,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _Format extends StatelessWidget {
  const _Format({
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final String current;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    final active = title == current;

    return Expanded(
      child: Button(
        onPressed: () {
          onPressed(title);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: 44,
          decoration: BoxDecoration(
            color: active ? const Color(0xff007AFF) : Colors.white,
            borderRadius: BorderRadius.circular(44),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: active ? Colors.white : Colors.black,
                fontSize: 14,
                fontFamily: AppFonts.funnel400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
