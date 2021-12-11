import 'dart:async';
import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

export 'package:image_cropper/image_cropper.dart';
export 'package:image_picker/image_picker.dart';

class ImageCropPicker {
  final ImagePicker _picker = ImagePicker();
  Future<File?> pickImage(
    BuildContext context, {
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    CropAspectRatio? aspectRatio,
    List<CropAspectRatioPreset> aspectRatioPresets = const <CropAspectRatioPreset>[
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    CropStyle cropStyle = CropStyle.rectangle,
    ImageCompressFormat compressFormat = ImageCompressFormat.jpg,
    int compressQuality = 90,
    AndroidUiSettings? androidUiSettings,
    IOSUiSettings? iosUiSettings,
  }) async {
    final Completer<XFile?> completer = Completer<XFile?>();
    showAdaptiveActionSheet<File?>(
      context: context,
      title: const Text('Select Image from'),
      bottomSheetColor: Colors.white,
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: const Text('Gallery'),
          onPressed: () async {
            final XFile? pickedFile = await _picker.pickImage(
              source: ImageSource.gallery,
            );

            completer.complete(pickedFile);
          },
        ),
        BottomSheetAction(
          title: const Text('Camera'),
          onPressed: () async {
            final XFile? pickedFile = await _picker.pickImage(
              source: ImageSource.camera,
            );
            completer.complete(pickedFile);
          },
        ),
      ],
      cancelAction: CancelAction(
        title: const Text('Cancel'),
      ),
    );
    final XFile? pickedFile = await completer.future;

    Navigator.of(context).pop();
    if (pickedFile == null) {
      return null;
    }
    // if (Platform.isAndroid) return File(pickedFile.path);
    return cropFile(
      sourcePath: pickedFile.path,
      maxWidth: maxWidth?.round(),
      maxHeight: maxHeight?.round(),
      aspectRatio: aspectRatio,
      aspectRatioPresets: aspectRatioPresets,
      cropStyle: cropStyle,
      compressFormat: compressFormat,
      compressQuality: compressQuality,
      androidUiSettings: androidUiSettings,
      iosUiSettings: iosUiSettings,
    );
  }

  Future<File?> cropFile({
    required String sourcePath,
    int? maxWidth,
    int? maxHeight,
    CropAspectRatio? aspectRatio,
    List<CropAspectRatioPreset> aspectRatioPresets = const <CropAspectRatioPreset>[
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    CropStyle cropStyle = CropStyle.rectangle,
    ImageCompressFormat compressFormat = ImageCompressFormat.jpg,
    int compressQuality = 90,
    AndroidUiSettings? androidUiSettings,
    IOSUiSettings? iosUiSettings,
  }) async {
    return ImageCropper.cropImage(
      sourcePath: sourcePath,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      aspectRatio: aspectRatio,
      aspectRatioPresets: aspectRatioPresets,
      cropStyle: cropStyle,
      compressFormat: compressFormat,
      compressQuality: compressQuality,
      androidUiSettings: androidUiSettings,
      iosUiSettings: iosUiSettings,
    );
  }
}
