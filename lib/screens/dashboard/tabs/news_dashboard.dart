import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/blocs/news/news_cubit.dart';
import 'package:itmentor/models/news.dart';
import 'package:itmentor/services/locator.dart';
import 'package:itmentor/services/logging_service.dart';
import 'package:itmentor/utilities/consts.dart';

import '../../widgets/loading_widget.dart';
import '../dashboard_item.dart';

class NewsDashboard extends StatelessWidget {
  const NewsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          locator<NewsCubit>().loadNews();
        },
        child: BlocBuilder<NewsCubit, NewsState>(
          bloc: locator<NewsCubit>(),
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
                        title: data[index].title,
                        onTap: () {},
                        onDelete: () {
                          _showConfirmationDialog(context, data[index]);
                        },
                        onEdit: () {
                          _showEditPostDialog(context, data[index]);
                        },
                        subtitle: data[index].content,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: FloatingActionButton.extended(
                      heroTag: 'news',
                      label: const Text('إضافة منشور'),
                      onPressed: () {
                        _showAddPostDialog(context);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              error: (message) => ErrorWidget(message),
            );
          },
        ));
  }

  void _showAddPostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddEditPostDialog(
          onSave: (post) {
            locator<NewsCubit>().createPost(post);
          },
        );
      },
    );
  }

  void _showEditPostDialog(BuildContext context, NewsModel post) {
    showDialog(
      context: context,
      builder: (context) {
        return AddEditPostDialog(
          post: post,
          onSave: (updatedDepartment) {
            locator<NewsCubit>().updatePost(post);
          },
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context, NewsModel post) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تأكيد الحذف'),
            content: const Text('هل أنت متأكد من حذف المنشور؟'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  locator<NewsCubit>().deletePost(post.id);
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

class AddEditPostDialog extends StatefulWidget {
  final NewsModel? post;
  final Function(NewsModel) onSave;

  const AddEditPostDialog({Key? key, this.post, required this.onSave})
      : super(key: key);

  @override
  _AddEditPostDialogState createState() => _AddEditPostDialogState();
}

class _AddEditPostDialogState extends State<AddEditPostDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();
  final _urlController = TextEditingController();
  
  bool _isPinned = false;

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _titleController.text = widget.post!.title;
      _contentController.text = widget.post!.content;
      _authorController.text = widget.post!.author ?? '';
      _urlController.text = widget.post!.url ?? '';
      _isPinned = widget.post!.isPinned ?? false;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text(widget.post == null ? 'إضافة منشور' : 'تعديل منشور'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: Consts.defaultInputBorder,
                  labelText: 'العنوان',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال العنوان';
                  }
                  return null;
                },
              ),
              Consts.gap16,
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  border: Consts.defaultInputBorder,
                  labelText: 'المحتوى',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال المحتوى';
                  }
                  return null;
                },
              ),
              Consts.gap16,
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(
                  border: Consts.defaultInputBorder,
                  labelText: 'الكاتب',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الكاتب';
                  }
                  return null;
                },
              ),
              Consts.gap16,
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(
                  border: Consts.defaultInputBorder,
                  labelText: 'الرابط',
                ),
              ),
              Consts.gap16,
              CheckboxListTile(
                title: const Text('تثبيت المنشور'),
                value: _isPinned,
                onChanged: (value) {
                  setState(() {
                    _isPinned = value!;
                  });
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final post = NewsModel(
                  title: _titleController.text,
                  content: _contentController.text,
                  publishedAt: DateTime.now(),
                  id: widget.post != null
                      ? widget.post!.id
                      : DateTime.now().toIso8601String(),
                  author: _authorController.text,
                  isPinned: _isPinned,
                  url: _urlController.text,
                );
                // if (widget.post != null) {
                //   locator<NewsCubit>().updatePost(post);
                // } else {
                //   locator<NewsCubit>().createPost(post);
                // }
                widget.onSave(post);
                Navigator.of(context).pop();
              }
            },
            child: Text(widget.post == null ? 'إضافة' : 'حفظ'),
          ),
        ],
      ),
    );
  }
}
