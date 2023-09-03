import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/blocs/courses/courses_cubit.dart';
import 'package:itmentor/models/course.dart';
import 'package:itmentor/screens/dashboard/dashboard_item.dart';
import 'package:itmentor/screens/widgets/loading_widget.dart';
import 'package:itmentor/services/locator.dart';
import 'package:itmentor/utilities/consts.dart';

class CoursesDashboard extends StatelessWidget {
  const CoursesDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coursesCubit = locator<CoursesCubit>();

    return RefreshIndicator(
      onRefresh: () {
        return coursesCubit.loadCourses();
      },
      child: BlocBuilder<CoursesCubit, CoursesState>(
        bloc: coursesCubit,
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            loaded: (data) => Stack(
              children: [
                ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return DashboardItem(
                      title: data[index].name,
                      subtitle: data[index].courseCode,
                      onDelete: () {
                        //  coursesCubit.deleteCourse(data[index]);
                        // show confirmation dialog
                        _showConfirmationDialog(context, data[index]);
                      },
                      onEdit: () {
                        _showEditCourseDialog(context, data[index]);
                      },
                      onTap: () {},
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: FloatingActionButton.extended(
                    heroTag: 'addCourse',
                    onPressed: () {
                      _showAddCourseDialog(context);
                      //  locator<CoursesCubit>().addBulkCourses();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة مقرر'),
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

  void _showAddCourseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddEditCourseDialog(
          onSave: (course) {
            locator<CoursesCubit>().addCourse(course);
          },
        );
      },
    );
  }

  void _showEditCourseDialog(BuildContext context, CourseModel course) {
    showDialog(
      context: context,
      builder: (context) {
        return AddEditCourseDialog(
          course: course,
          onSave: (updatedCourse) {
            locator<CoursesCubit>().updateCourse(updatedCourse);
          },
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context, CourseModel course) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تأكيد الحذف'),
            content: const Text('هل أنت متأكد من حذف المقرر؟'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  locator<CoursesCubit>().deleteCourse(course);
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

class AddEditCourseDialog extends StatefulWidget {
  final CourseModel? course;
  final void Function(CourseModel) onSave;

  const AddEditCourseDialog({
    Key? key,
    this.course,
    required this.onSave,
  }) : super(key: key);

  @override
  _AddEditCourseDialogState createState() => _AddEditCourseDialogState();
}

class _AddEditCourseDialogState extends State<AddEditCourseDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _courseCodeController = TextEditingController();
  final _links = <MapEntry<String, String>>[];
  final _requirements = <String>[];

  @override
  void initState() {
    super.initState();
    if (widget.course != null) {
      _nameController.text = widget.course!.name;
      _courseCodeController.text = widget.course!.courseCode;
      _links.addAll(widget.course!.links.entries);
      _requirements.addAll(widget.course!.requirements);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _courseCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  width: MediaQuery.of(context).size.width * 0.8,
    //   height: MediaQuery.of(context).size.height * 0.8,
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        scrollable: false,
        title: Text(widget.course == null ? 'إضافة مقرر' : 'تعديل المقرر'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: Consts.defaultInputBorder,
                      labelText: 'اسم المقرر',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال اسم المقرر';
                      }
                      return null;
                    },
                  ),
                  Consts.gap16,
                  TextFormField(
                    controller: _courseCodeController,
                    decoration: const InputDecoration(
                      border: Consts.defaultInputBorder,
                      labelText: 'رمز المقرر',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى إدخال رمز المقرر';
                      }
                      return null;
                    },
                  ),
                  Consts.gap16,
                  Text(
                    'الروابط المرتبطة بالمقرر',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Consts.gap16,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _links.length + 1,
                    itemBuilder: (context, index) {
                      if (index == _links.length) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _links.add(const MapEntry('', ''));
                              });
                            },
                            child: const Text('إضافة رابط جديد'),
                          ),
                        );
                      }
                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: Consts.paddingSmall),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: _links[index].key,
                                decoration: const InputDecoration(
                                  border: Consts.defaultInputBorder,
                                  labelText: 'الاسم',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _links[index] =
                                        MapEntry(value, _links[index].value);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                initialValue: _links[index].value,
                                decoration: const InputDecoration(
                                  border: Consts.defaultInputBorder,
                                  labelText: 'الرابط',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _links[index] =
                                        MapEntry(_links[index].key, value);
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _links.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Consts.gap16,
                  Text(
                    'متطلبات المقرر',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _requirements.length + 1,
                    itemBuilder: (context, index) {
                      if (index == _requirements.length) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _requirements.add('');
                              });
                            },
                            child: const Text('إضافة متطلب جديد'),
                          ),
                        );
                      }
                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: Consts.paddingMedium),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: _requirements[index],
                                decoration: const InputDecoration(
                                  border: Consts.defaultInputBorder,
                                  labelText: 'المتطلب',
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _requirements[index] = value;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _requirements.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
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
                final links = Map.fromEntries(
                    _links.map((e) => MapEntry(e.key, e.value)));
                final requirements = _requirements.toList();
                final course = CourseModel(
                  id: widget.course?.id ?? DateTime.now().toIso8601String(),
                  name: _nameController.text,
                  courseCode: _courseCodeController.text,
                  links: links,
                  requirements: requirements,
                );

                widget.onSave(course);
                Navigator.of(context).pop();
              }
            },
            child: Text(widget.course == null ? 'إضافة' : 'حفظ'),
          ),
        ],
      ),
    );
  }
}
