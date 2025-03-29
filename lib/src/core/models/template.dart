import '../config/constants.dart';

class Template {
  Template({
    required this.id,
    required this.asset,
    required this.title,
  });

  final int id;
  final String asset;
  final String title;
}

List<Template> templates = [
  Template(id: 1, asset: Assets.template1, title: 'Classic Professional'),
  Template(id: 2, asset: Assets.template2, title: 'Modern Elegance'),
  Template(id: 3, asset: Assets.template3, title: 'Minimalist Chic'),
  Template(id: 4, asset: Assets.template4, title: 'Corporate Edge'),
  Template(id: 5, asset: Assets.template5, title: 'Bold & Clean'),
  Template(id: 6, asset: Assets.template6, title: 'Creative Vision'),
  Template(id: 7, asset: Assets.template7, title: 'Executive Prestige'),
  Template(id: 8, asset: Assets.template8, title: 'Sleek Simplicity'),
  Template(id: 9, asset: Assets.template9, title: 'Innovative Flair'),
  Template(id: 10, asset: Assets.template10, title: 'Fresh & Contemporary'),
  Template(id: 11, asset: Assets.template11, title: 'Formal Excellence'),
  Template(id: 12, asset: Assets.template12, title: 'Elegant Contrast'),
  Template(id: 13, asset: Assets.template13, title: 'Structured Impact'),
  Template(id: 14, asset: Assets.template14, title: 'Dynamic Layout'),
  Template(id: 15, asset: Assets.template15, title: 'Smart & Stylish'),
  Template(id: 16, asset: Assets.template16, title: 'Refined Professionalism'),
  Template(id: 17, asset: Assets.template17, title: 'Tech-Savvy Design'),
  Template(id: 18, asset: Assets.template18, title: 'Standout Resume'),
  Template(id: 19, asset: Assets.template19, title: 'Artistic Touch'),
  Template(id: 20, asset: Assets.template20, title: 'Versatile & Timeless'),
];
