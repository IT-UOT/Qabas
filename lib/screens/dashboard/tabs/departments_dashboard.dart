import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/blocs/courses/courses_cubit.dart';
import 'package:itmentor/models/course.dart';
import 'package:itmentor/models/department.dart';
import 'package:itmentor/screens/dashboard/dashboard_item.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';
import 'package:itmentor/services/locator.dart';
import 'package:itmentor/utilities/consts.dart';

import '../../../blocs/departments/departments_cubit.dart';

class DepartmentsDashboard extends StatelessWidget {
  const DepartmentsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        locator<DepartmentsCubit>().loadDepartments();
      },
      child: BlocBuilder<DepartmentsCubit, DepartmentsState>(
        bloc: locator<DepartmentsCubit>(),
        builder: (context, state) {
          return state.when(
            () => Container(),
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            loaded: (data) => Stack(
              children: [
                ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return DashboardItem(
                      title: data[index].name,
                      onTap: () {},
                      onDelete: () {
                        _showConfirmationDialog(context, data[index]);
                      },
                      onEdit: () {
                        _showEditCourseDialog(context, data[index]);
                      },
                      //   subtitle: data[index].name,
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: FloatingActionButton.extended(
                    heroTag: 'addDepartment',
                    onPressed: () {
                      _showAddDepartmentDialog(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة قسم'),
                  ),
                )
              ],
            ),
            error: (message) => ErrorWidget(message),
          );
        },
      ),
    );
  }

  void _showAddDepartmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddEditDepartmenteDialog(
          onSave: (department) {
            locator<DepartmentsCubit>().createDepartment(department);
          },
        );
      },
    );
  }

  void _showEditCourseDialog(BuildContext context, DepartmentModel department) {
    showDialog(
      context: context,
      builder: (context) {
        return AddEditDepartmenteDialog(
          department: department,
          onSave: (updatedDepartment) {
            locator<DepartmentsCubit>().updateDepartment(updatedDepartment);
          },
        );
      },
    );
  }

  void _showConfirmationDialog(
      BuildContext context, DepartmentModel deparmtnt) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تأكيد الحذف'),
            content: const Text('هل أنت متأكد من حذف القسم'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('إلغاء'),
              ),
              ElevatedButton(
                onPressed: () {
                  locator<DepartmentsCubit>().deleteDepartment(deparmtnt.id);
                  Navigator.of(context).pop();
                },
                child: const Text('حذف'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddEditDepartmenteDialog extends StatefulWidget {
  final Function(DepartmentModel) onSave;
  final DepartmentModel? department;

  const AddEditDepartmenteDialog(
      {Key? key, required this.onSave, this.department})
      : super(key: key);

  @override
  _AddEditDepartmenteDialogState createState() =>
      _AddEditDepartmenteDialogState();
}

class _AddEditDepartmenteDialogState extends State<AddEditDepartmenteDialog> {
  final _formKey = GlobalKey<FormState>();
  final _departmentNameController = TextEditingController();
  final _depMapImgSrcController = TextEditingController();
  final _departmentDescriptionController = TextEditingController();
  final _departmentCodeController = TextEditingController();
  DateTime? _createdAt;
  final _depRequirements = <String>[];
  final _selectedCourses = <String>[];

  @override
  void initState() {
    super.initState();
    if (widget.department != null) {
      _departmentNameController.text = widget.department!.name;
      _depMapImgSrcController.text = widget.department!.depMapImgSrc;
      _departmentDescriptionController.text = widget.department!.description;
      _departmentCodeController.text = widget.department!.depCode;
      _depRequirements.addAll(widget.department!.depRequirements);
      _selectedCourses.addAll(widget.department!.courses);
      _createdAt = widget.department!.createdAt;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        scrollable: false,
        title: Text(widget.department == null ? 'إضافة قسم' : 'تعديل قسم'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _departmentNameController,
                    decoration: const InputDecoration(
                      border: Consts.defaultInputBorder,
                      hintText: 'اسم القسم',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال اسم القسم';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _departmentCodeController,
                    decoration: const InputDecoration(
                      border: Consts.defaultInputBorder,
                      hintText: 'كود القسم',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال كود القسم';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _departmentDescriptionController,
                    decoration: const InputDecoration(
                      border: Consts.defaultInputBorder,
                      hintText: 'وصف القسم',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال وصف القسم';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _depMapImgSrcController,
                    decoration: const InputDecoration(
                      border: Consts.defaultInputBorder,
                      hintText: 'رابط صورة الخريطة',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال رابط صورة الخريطة';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('متطلبات القسم'),
                      const SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _depRequirements.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: Consts.paddingSmall),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    initialValue: _depRequirements[index],
                                    decoration: const InputDecoration(
                                      border: Consts.defaultInputBorder,
                                      hintText: 'متطلب القسم',
                                    ),
                                    onChanged: (value) {
                                      _depRequirements[index] = value;
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      _depRequirements.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _depRequirements.add('');
                          });
                        },
                        child: const Text('إضافة متطلب'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<CoursesCubit, CoursesState>(
                    bloc: locator<CoursesCubit>(),
                    builder: (context, state) {
                      return state.maybeMap(orElse: (() {
                        return const SizedBox();
                      }), loaded: (data) {
                        final groupedCourses = groupBy(data.courses,
                            (course) => course.courseCode.substring(0, 4));

                        return ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: groupedCourses.entries.map((entry) {
                            final sectionName = entry.key;
                            final sectionCourses = entry.value;

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: Consts.paddingSmall),
                              child: ExpansionTile(
                                title: Text(
                                    '$sectionName (${sectionCourses.length})'),
                                leading: Checkbox(
                                  //  title: const Text('Select all'),
                                  value: sectionCourses.every((course) =>
                                      _selectedCourses.contains(course.id)),
                                  onChanged: (selected) {
                                    setState(() {
                                      if (selected!) {
                                        _selectedCourses.addAll(sectionCourses
                                            .map((course) => course.id));
                                      } else {
                                        _selectedCourses.removeWhere((id) =>
                                            sectionCourses
                                                .map((course) => course.id)
                                                .contains(id));
                                      }
                                    });
                                  },
                                ),
                                children: [
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 16,
                                    children: sectionCourses.map((course) {
                                      return FilterChip(
                                        label: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(course.name),
                                            Text(course.courseCode),
                                          ],
                                        ),
                                        selected: _selectedCourses
                                            .contains(course.id),
                                        onSelected: (selected) {
                                          setState(() {
                                            if (selected) {
                                              _selectedCourses.add(course.id);
                                            } else {
                                              _selectedCourses
                                                  .remove(course.id);
                                            }
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
                                  Consts.gap16,
                                  const Divider(),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final department = DepartmentModel(
                  id: _departmentCodeController.text,
                  name: _departmentNameController.text,
                  depMapImgSrc: _depMapImgSrcController.text,
                  depRequirements: _depRequirements,
                  courses: _selectedCourses,
                  createdAt: _createdAt ?? DateTime.now(),
                  depCode: _departmentCodeController.text,
                  description: _departmentDescriptionController.text,
                );
                widget.onSave(department);
                Navigator.of(context).pop();
              }
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _departmentNameController.dispose();
    _depMapImgSrcController.dispose();
    super.dispose();
  }

  Map<String, List<CourseModel>> groupBy(
      List<CourseModel> courses, String Function(CourseModel) key) {
    final groupedCourses = <String, List<CourseModel>>{};
    for (final course in courses) {
      final courseKey = key(course);
      if (groupedCourses.containsKey(courseKey)) {
        groupedCourses[courseKey]!.add(course);
      } else {
        groupedCourses[courseKey] = [course];
      }
    }
    return groupedCourses;
  }
}
