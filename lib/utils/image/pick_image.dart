import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../utils.dart';

Future<XFile?> pickImage({required BuildContext context}) async {
  final picker = ImagePicker();

  return await showModalBottomSheet<XFile>(
    context: context,
    backgroundColor: Colors.white,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10,),
        Center(
          child: Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        ListTile(
          onTap: () async {
            final pickedFile = await picker.pickImage(source: ImageSource.camera);
            context.pop(pickedFile);
          },
          leading: ASIcon.solid(ASIconData.camera, color: Style.primaryColor,),
          title: Text('Camera'),
        ),
        ListTile(
          onTap: () async {
            final pickedFile = await picker.pickImage(source: ImageSource.gallery);
            context.pop(pickedFile);
          },
          leading: ASIcon.solid(ASIconData.images, color: Style.primaryColor,),
          title: Text('Gallery'),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => context.pop(),
                child: Text("Cancel", style: Style.txt16,),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20,),
      ],
    ),
  );
}