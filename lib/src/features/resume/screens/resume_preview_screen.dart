import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/resume.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/resume_bloc.dart';

class ResumePreviewScreen extends StatefulWidget {
  const ResumePreviewScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumePreviewScreen';

  @override
  State<ResumePreviewScreen> createState() => _ResumePreviewScreenState();
}

class _ResumePreviewScreenState extends State<ResumePreviewScreen> {
  Key pdfViewKey = UniqueKey();
  Uint8List? pdfData;

  void createPdf() async {
    try {
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Center(
            child: pw.Text(
              widget.resume.name,
              style: pw.TextStyle(
                color: PdfColors.redAccent,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );

      final bytes = await pdf.save();
      setState(() {
        pdfData = bytes;
        pdfViewKey = UniqueKey();
      });
    } catch (e) {
      logger(e);
    }
  }

  void onExport() async {
    if (pdfData == null) return;

    try {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/resume.pdf');
      await file.writeAsBytes(pdfData!);

      await Share.shareXFiles([XFile(file.path)]);
    } catch (e) {
      logger(e);
    }
  }

  @override
  void initState() {
    super.initState();
    createPdf();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: Appbar(
        title: l.myResume,
        right: AppbarButton(
          asset: Assets.close,
          onPressed: () {
            DialogWidget.show(
              context,
              title: l.delete,
              description: l.deleteDescription,
              onYes: () {
                context
                    .read<ResumeBloc>()
                    .add(DeleteResume(resume: widget.resume));
                context.pop();
              },
            );
          },
        ),
      ),
      body: Bg(
        topWidgets: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainButton(
                title: l.export,
                onPressed: onExport,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
        child: pdfData == null
            ? const LoadingWidget()
            : Padding(
                padding: const EdgeInsets.all(16),
                child: PDFView(
                  key: pdfViewKey,
                  pdfData: pdfData,
                ),
              ),
      ),
    );
  }
}
