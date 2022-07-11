import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solid_software_test_project/generated/assets.dart';
import 'package:solid_software_test_project/res/colors/app_colors.dart';
import 'package:solid_software_test_project/res/styles/app_styles.dart';

class AppBarWithSearch extends StatefulWidget with PreferredSizeWidget {
  final String appBarTitle;
  final void Function(String) filterSearchResults;
  final void Function() onSave;
  final void Function()? pop;

  const AppBarWithSearch({
    Key? key,
    required this.appBarTitle,
    required this.filterSearchResults,
    required this.onSave,
    this.pop,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 100);

  @override
  State<AppBarWithSearch> createState() => _AppBarWithSearchState();
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  final _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 14,
        ),
        color: Colors.black,
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: widget.pop,
                  icon: SvgPicture.asset(
                    Assets.assetsBackWhite,
                    width: 12,
                    height: 20,
                  ),
                ),
                Text(
                  widget.appBarTitle,
                  style: AppStyles.appBarTitle,
                ),
                TextButton(
                  onPressed: widget.onSave,
                  child: const Text(
                    'Save',
                    style: AppStyles.saveAppBArButton,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _editingController,
              style: const TextStyle(color: AppColors.hintGray),
              cursorColor: AppColors.hintGray,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.darkGray,
                prefixIcon: IconTheme(
                  data: IconThemeData(
                    color: AppColors.hintGray,
                  ),
                  child: Icon(Icons.search),
                ),
                hintText: 'Search',
                hintStyle: AppStyles.hintSearchText,
              ),
              onChanged: widget.filterSearchResults,
            ),
          ],
        ),
      ),
    );
  }
}
