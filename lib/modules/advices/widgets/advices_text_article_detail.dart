import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

import '../../../data/models/advices_article.dart';

class AdvicesTextArticleDetails extends StatefulWidget {
  final AdvicesArticle article;
  final AdvicesCategory category;

  const AdvicesTextArticleDetails({
    required this.article,
    super.key,
    required this.category,
  });



  @override
  State<AdvicesTextArticleDetails> createState() =>
      _AdvicesTextArticleDetailsState();
}

class _AdvicesTextArticleDetailsState extends State<AdvicesTextArticleDetails> {
  final ScrollController _scrollController = ScrollController();
  double _proportion = 0;


  static const Color _dividerColor = Color(0x194b399c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _proportion = _scrollController.offset /
          _scrollController.position.viewportDimension;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AdvicesCategory categoryFromArticle = AdvicesCategory.fromIconName(
      widget.article.iconName,
    );

    return AppScaffoldPage(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _appBar(context),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ThemeSizedBox.height32,
                  CircleAvatar(
                    backgroundColor: categoryFromArticle.categoryColor,
                    child: SvgPicture.asset(
                      categoryFromArticle.iconPath,
                      color: Colors.white,
                    ),
                  ),
                  ThemeSizedBox.height8,
                  TitleMedium(
                    widget.category.categoryTitle?.toUpperCase() ?? "",
                    color: ThemeColor.darkBlue,
                    textAlign: TextAlign.center,
                  ),
                  ThemeSizedBox.height4,
                  DisplayMedium(
                    widget.article.title,
                    textAlign: TextAlign.center,
                  ).applyShaders(context),
                  ThemeSizedBox.height16,
                  BodyLarge(
                    widget.article.shortDescription ?? "",
                    color: ThemeColor.darkBlue,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                  ThemeSizedBox.height48,
                  const Divider(
                    color: _dividerColor,
                  ),
                  ThemeSizedBox.height48,
                  Html(
                    data: widget.article.text,
                  ),
                  ThemeSizedBox.height48,
                  LabelLarge(
                    widget.article.disclaimer ?? "",
                    color: _disclaimerColor,
                    fontWeight: FontWeight.w500,
                  ),
                  ThemeSizedBox.height60,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: widget.category.categoryColor,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: SvgPicture.asset(
            ThemeIcon.back,
            color: ThemeColor.darkBlue,
          ),
        ),
      ),
      expandedHeight: 375,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: Stack(
        children: [
          Visibility(
            visible: widget.article.thumbImageUrl?.isNotEmpty == true,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _proportion <= 0.40 ? 1.0 : 0.0,
              child: Image.network(
                widget.article.thumbImageUrl!,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      ThemeIcon.shareGradient,
                    ),
                  ),
                  ThemeSizedBox.width8,
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      ThemeIcon.savedEmptyGradient,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
