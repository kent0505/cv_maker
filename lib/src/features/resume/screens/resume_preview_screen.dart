import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/data.dart';
import '../../../core/models/resume.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/bg.dart';
import '../../../core/widgets/dialog_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/resume_bloc.dart';
import '../widgets/templates/template1.dart';

class ResumePreviewScreen extends StatefulWidget {
  const ResumePreviewScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumePreviewScreen';

  @override
  State<ResumePreviewScreen> createState() => _ResumePreviewScreenState();
}

class _ResumePreviewScreenState extends State<ResumePreviewScreen> {
  Key pdfViewKey = UniqueKey();
  final previewContainer = GlobalKey();
  Uint8List? pdfData;
  Data data = emptyData;

  Future<Uint8List?> captureWidgetAsPng(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 5);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      logger(e);
      return null;
    }
  }

  void createPdf() async {
    logger('CREATE PDF');
    try {
      final pdf = pw.Document();

      // final imageFile = File(data.resume!.photo);
      // final imageBytes = await imageFile.readAsBytes();
      // final photoImage = pw.MemoryImage(imageBytes);

      pdf.addPage(
        pw.MultiPage(
          margin: pw.EdgeInsets.zero,
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => [
            ...List.generate(
              100,
              (index) {
                return pw.Text('Index $index');
              },
            )
          ],
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
    final data2 = context.read<ResumeBloc>().data;
    final resume = widget.resume;
    data = Data(
      resume: resume,
      languages: data2.languages.where((x) => x.id == resume.id).toList(),
      educations: data2.educations.where((x) => x.id == resume.id).toList(),
      experiences: data2.experiences.where((x) => x.id == resume.id).toList(),
      skills: data2.skills.where((x) => x.id == resume.id).toList(),
      interests: data2.interests.where((x) => x.id == resume.id).toList(),
    );
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: pdfData == null
              ? LoadingWidget()
              : AspectRatio(
                  aspectRatio: 1 / 1.42,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    // child: PDFView(
                    //   key: pdfViewKey,
                    //   pdfData: pdfData,
                    // ),
                    child: RepaintBoundary(
                      key: previewContainer,
                      child: Template1(data: data),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
