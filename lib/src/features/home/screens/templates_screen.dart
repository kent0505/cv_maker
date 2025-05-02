import 'package:cv_maker/src/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../core/config/constants.dart';
import '../../../core/models/template.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../settings/screens/settings_screen.dart';
import '../../vip/bloc/vip_bloc.dart';
import '../../vip/screens/vip_sheet.dart';
import '../widgets/template_card.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({super.key});

  @override
  State<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  Offering? offering;

  Future<void> getOffering() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      offering = offerings.getOffering(
        'monthly_subsctiption_cv',
      );
    } catch (e) {
      logger(e);
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<VipBloc>().add(CheckVip());
    getOffering();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final isVip = context.watch<VipBloc>().state;

    return BlocListener<VipBloc, bool>(
      listener: (context, state) {
        if (!state) {
          Future.delayed(Duration(seconds: 1), () {
            if (context.mounted && offering != null) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return VipSheet(offering: offering);
                },
              );
            }
          });
        }
      },
      child: Stack(
        children: [
          Container(
            color: const Color(0xff007AFF),
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 64),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        l.chooseTemplate,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: AppFonts.funnel800,
                          height: 1,
                        ),
                      ),
                    ),
                    Text(isVip.toString()),
                    // Button(
                    //   onPressed: () async {
                    //     try {
                    //       Offerings offerings = await Purchases.getOfferings();
                    //       final offering = offerings.getOffering(
                    //         'monthly_subsctiption_cv',
                    //       );
                    //       // if (offerings.current != null &&
                    //       //     offerings.current!.availablePackages.isNotEmpty) {
                    //       //   final packages = offerings.current!.availablePackages;
                    //       //   // Use this to show purchase options
                    //       //   for (var package in packages) {
                    //       //     logger(package.storeProduct.priceString);
                    //       //   }
                    //       // }
                    //       // CustomerInfo customerInfo =
                    //       //     await Purchases.getCustomerInfo();
                    //       // logger(customerInfo.entitlements);
                    //       if (context.mounted) {
                    //         showModalBottomSheet(
                    //           context: context,
                    //           isScrollControlled: true,
                    //           builder: (context) {
                    //             return VipSheet(offering: offering);
                    //           },
                    //         );
                    //       }
                    //     } catch (e) {
                    //       logger(e);
                    //     }
                    //   },
                    //   child: const SvgWidget(Assets.settings),
                    // ),
                    Button(
                      onPressed: () {
                        context.push(SettingsScreen.routePath);
                      },
                      child: const SvgWidget(Assets.settings),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 160),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16).copyWith(bottom: 120),
                children: [
                  Wrap(
                    spacing: 30,
                    runSpacing: 10,
                    children: List.generate(
                      templates.length,
                      (index) {
                        return TemplateCard(
                          template: templates[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
