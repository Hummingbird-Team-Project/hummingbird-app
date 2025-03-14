import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/enum/mxnRate.dart';
import '../../../../../core/theme/colors/app_color.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../../../../../core/widgets/color_picker_widget.dart';
import '../../../../../core/widgets/mxnContainer.dart';
import '../../../../models/subject/subject.dart';
import '../../../../viewmodels/subject/subject_viewmodel.dart';

class SubjectAddScreen extends ConsumerStatefulWidget {
  const SubjectAddScreen(
      {super.key, required this.subjects, required this.index});

  final int index;
  final List<Subject> subjects;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubjectEditScreenState();
}

class _SubjectEditScreenState extends ConsumerState<SubjectAddScreen> {
  TextEditingController titleController = TextEditingController();
  String selectedColor = "227C9D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr("SubjectAddScreen.AddSubject"))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      tr("SubjectAddScreen.SubjectName"),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  MxNcontainer(
                    MxN_rate: MxNRate.TWOBYQUARTER,
                    MxN_child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      tr("SubjectAddScreen.SelectColor"),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  ColorPickerWidget(
                    initialColor: selectedColor,
                    onColorSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (widget.subjects
                      .where((element) =>
                          element.title == titleController.value.text)
                      .toList()
                      .isNotEmpty) {
                    showSnackBar(
                        message: tr("SubjectAddScreen.DuplicateSubject"));
                  } else {
                    final newSubject = Subject(
                      title: titleController.value.text,
                      color: selectedColor,
                      order: widget.index,
                    );

                    ref
                        .read(subjectViewModelProvider.notifier)
                        .addSubject(newSubject);

                    context.pop();
                  }
                },
                child: MxNcontainer(
                  MxN_rate: MxNRate.TWOBYQUARTER,
                  MxN_child: Container(
                    color: AppColor.themeGrey,
                    child: Center(
                      child: Text(tr("SubjectAddScreen.Save")),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
