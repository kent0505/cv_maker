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
import '../../../core/widgets/main_button.dart';
import '../bloc/resume_bloc.dart';
import '../widgets/templates/template1.dart';
import '../widgets/templates/template2.dart';
import '../widgets/templates/template3.dart';
import '../widgets/templates/template4.dart';
import '../widgets/templates/template5.dart';
import '../widgets/templates/template6.dart';
import '../widgets/templates/template7.dart';
import '../widgets/templates/template8.dart';
import '../widgets/templates/template9.dart';
import '../widgets/templates/template10.dart';
import '../widgets/templates/template11.dart';
import '../widgets/templates/template12.dart';
import '../widgets/templates/template13.dart';
import '../widgets/templates/template14.dart';
import '../widgets/templates/template15.dart';
import '../widgets/templates/template16.dart';
import '../widgets/templates/template17.dart';
import '../widgets/templates/template18.dart';
import '../widgets/templates/template19.dart';
import '../widgets/templates/template20.dart';

class ResumePreviewScreen extends StatefulWidget {
  const ResumePreviewScreen({super.key, required this.resume});

  final Resume resume;

  static const routePath = '/ResumePreviewScreen';

  @override
  State<ResumePreviewScreen> createState() => _ResumePreviewScreenState();
}

class _ResumePreviewScreenState extends State<ResumePreviewScreen> {
  final previewContainer = GlobalKey();
  Uint8List? pdfData;
  Data data = emptyData;

  Future<Uint8List?> captureWidgetAsPng(GlobalKey key) async {
    try {
      final context = key.currentContext;
      if (context == null) return null;

      final boundary = context.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;

      while (boundary.debugNeedsPaint) {
        await Future.delayed(Duration(milliseconds: 10));
      }

      final image = await boundary.toImage(pixelRatio: 3);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      logger(e);
      return null;
    }
  }

  Future<void> createPdf() async {
    logger('CREATE PDF');
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final imageBytes = await captureWidgetAsPng(previewContainer);

      if (imageBytes == null) return;

      final pdf = pw.Document();

      final image = pw.MemoryImage(imageBytes);

      pdf.addPage(
        pw.Page(
          margin: pw.EdgeInsets.zero,
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Center(
              child: pw.Image(
                image,
                fit: pw.BoxFit.contain,
              ),
            );
          },
        ),
      );

      final bytes = await pdf.save();

      if (mounted) {
        setState(() {
          pdfData = bytes;
        });
      }
    } catch (e) {
      logger(e);
    }
  }

  void onExport() async {
    if (pdfData == null) {
      logger('NULL');
      return;
    }

    try {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/${widget.resume.name} CV.pdf');
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
              if (pdfData != null)
                MainButton(
                  title: l.export,
                  onPressed: onExport,
                ),
              const SizedBox(height: 30),
            ],
          ),
        ],
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FittedBox(
                  child: SizedBox(
                    width: 550,
                    height: 550 * 1.41,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: RepaintBoundary(
                        key: previewContainer,
                        child: switch (data.resume!.template) {
                          1 => Template1(data: data),
                          2 => Template2(data: data),
                          3 => Template3(data: data),
                          4 => Template4(data: data),
                          5 => Template5(data: data),
                          6 => Template6(data: data),
                          7 => Template7(data: data),
                          8 => Template8(data: data),
                          9 => Template9(data: data),
                          10 => Template10(data: data),
                          11 => Template11(data: data),
                          12 => Template12(data: data),
                          13 => Template13(data: data),
                          14 => Template14(data: data),
                          15 => Template15(data: data),
                          16 => Template16(data: data),
                          17 => Template17(data: data),
                          18 => Template18(data: data),
                          19 => Template19(data: data),
                          20 => Template20(data: data),
                          _ => const SizedBox(),
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
