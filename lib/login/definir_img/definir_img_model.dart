import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/avatar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'definir_img_widget.dart' show DefinirImgWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DefinirImgModel extends FlutterFlowModel<DefinirImgWidget> {
  ///  Local state fields for this page.

  Color selectedbgUpload = Color(4285005984);

  Color selectedbrUpload = Color(4285005984);

  bool avatar = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for avatar01.
  late AvatarModel avatar01Model1;
  // Model for avatar02.
  late AvatarModel avatar02Model;
  // Model for avatar03.
  late AvatarModel avatar03Model;
  // Model for avatar01.
  late AvatarModel avatar01Model2;
  // Model for avatar01.
  late AvatarModel avatar01Model3;
  // Model for avatar01.
  late AvatarModel avatar01Model4;
  // Model for avatar01.
  late AvatarModel avatar01Model5;
  // Model for avatar01.
  late AvatarModel avatar01Model6;
  // Model for avatar01.
  late AvatarModel avatar01Model7;
  // Model for avatar01.
  late AvatarModel avatar01Model8;
  // Model for avatar01.
  late AvatarModel avatar01Model9;
  // Model for avatar01.
  late AvatarModel avatar01Model10;
  // Model for avatar01.
  late AvatarModel avatar01Model11;
  // Model for avatar01.
  late AvatarModel avatar01Model12;
  // Model for avatar01.
  late AvatarModel avatar01Model13;
  // Model for avatar01.
  late AvatarModel avatar01Model14;
  // Model for avatar01.
  late AvatarModel avatar01Model15;
  // Model for avatar01.
  late AvatarModel avatar01Model16;
  // Model for avatar01.
  late AvatarModel avatar01Model17;
  // Model for avatar01.
  late AvatarModel avatar01Model18;
  // Model for avatar01.
  late AvatarModel avatar01Model19;
  // Model for avatar01.
  late AvatarModel avatar01Model20;
  // Model for avatar01.
  late AvatarModel avatar01Model21;
  // Model for avatar01.
  late AvatarModel avatar01Model22;
  // Model for avatar01.
  late AvatarModel avatar01Model23;
  // Model for avatar01.
  late AvatarModel avatar01Model24;
  // Model for avatar01.
  late AvatarModel avatar01Model25;
  // Model for avatar01.
  late AvatarModel avatar01Model26;
  // Model for avatar01.
  late AvatarModel avatar01Model27;
  // Model for avatar01.
  late AvatarModel avatar01Model28;
  // Model for avatar01.
  late AvatarModel avatar01Model29;
  // Model for avatar01.
  late AvatarModel avatar01Model30;
  // Model for avatar01.
  late AvatarModel avatar01Model31;
  // Model for avatar01.
  late AvatarModel avatar01Model32;
  // Model for avatar01.
  late AvatarModel avatar01Model33;
  // Model for avatar01.
  late AvatarModel avatar01Model34;
  // Model for avatar01.
  late AvatarModel avatar01Model35;
  // Model for avatar01.
  late AvatarModel avatar01Model36;
  // Model for avatar01.
  late AvatarModel avatar01Model37;
  // Model for avatar01.
  late AvatarModel avatar01Model38;
  // Model for avatar01.
  late AvatarModel avatar01Model39;
  // Model for avatar01.
  late AvatarModel avatar01Model40;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    avatar01Model1 = createModel(context, () => AvatarModel());
    avatar02Model = createModel(context, () => AvatarModel());
    avatar03Model = createModel(context, () => AvatarModel());
    avatar01Model2 = createModel(context, () => AvatarModel());
    avatar01Model3 = createModel(context, () => AvatarModel());
    avatar01Model4 = createModel(context, () => AvatarModel());
    avatar01Model5 = createModel(context, () => AvatarModel());
    avatar01Model6 = createModel(context, () => AvatarModel());
    avatar01Model7 = createModel(context, () => AvatarModel());
    avatar01Model8 = createModel(context, () => AvatarModel());
    avatar01Model9 = createModel(context, () => AvatarModel());
    avatar01Model10 = createModel(context, () => AvatarModel());
    avatar01Model11 = createModel(context, () => AvatarModel());
    avatar01Model12 = createModel(context, () => AvatarModel());
    avatar01Model13 = createModel(context, () => AvatarModel());
    avatar01Model14 = createModel(context, () => AvatarModel());
    avatar01Model15 = createModel(context, () => AvatarModel());
    avatar01Model16 = createModel(context, () => AvatarModel());
    avatar01Model17 = createModel(context, () => AvatarModel());
    avatar01Model18 = createModel(context, () => AvatarModel());
    avatar01Model19 = createModel(context, () => AvatarModel());
    avatar01Model20 = createModel(context, () => AvatarModel());
    avatar01Model21 = createModel(context, () => AvatarModel());
    avatar01Model22 = createModel(context, () => AvatarModel());
    avatar01Model23 = createModel(context, () => AvatarModel());
    avatar01Model24 = createModel(context, () => AvatarModel());
    avatar01Model25 = createModel(context, () => AvatarModel());
    avatar01Model26 = createModel(context, () => AvatarModel());
    avatar01Model27 = createModel(context, () => AvatarModel());
    avatar01Model28 = createModel(context, () => AvatarModel());
    avatar01Model29 = createModel(context, () => AvatarModel());
    avatar01Model30 = createModel(context, () => AvatarModel());
    avatar01Model31 = createModel(context, () => AvatarModel());
    avatar01Model32 = createModel(context, () => AvatarModel());
    avatar01Model33 = createModel(context, () => AvatarModel());
    avatar01Model34 = createModel(context, () => AvatarModel());
    avatar01Model35 = createModel(context, () => AvatarModel());
    avatar01Model36 = createModel(context, () => AvatarModel());
    avatar01Model37 = createModel(context, () => AvatarModel());
    avatar01Model38 = createModel(context, () => AvatarModel());
    avatar01Model39 = createModel(context, () => AvatarModel());
    avatar01Model40 = createModel(context, () => AvatarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    avatar01Model1.dispose();
    avatar02Model.dispose();
    avatar03Model.dispose();
    avatar01Model2.dispose();
    avatar01Model3.dispose();
    avatar01Model4.dispose();
    avatar01Model5.dispose();
    avatar01Model6.dispose();
    avatar01Model7.dispose();
    avatar01Model8.dispose();
    avatar01Model9.dispose();
    avatar01Model10.dispose();
    avatar01Model11.dispose();
    avatar01Model12.dispose();
    avatar01Model13.dispose();
    avatar01Model14.dispose();
    avatar01Model15.dispose();
    avatar01Model16.dispose();
    avatar01Model17.dispose();
    avatar01Model18.dispose();
    avatar01Model19.dispose();
    avatar01Model20.dispose();
    avatar01Model21.dispose();
    avatar01Model22.dispose();
    avatar01Model23.dispose();
    avatar01Model24.dispose();
    avatar01Model25.dispose();
    avatar01Model26.dispose();
    avatar01Model27.dispose();
    avatar01Model28.dispose();
    avatar01Model29.dispose();
    avatar01Model30.dispose();
    avatar01Model31.dispose();
    avatar01Model32.dispose();
    avatar01Model33.dispose();
    avatar01Model34.dispose();
    avatar01Model35.dispose();
    avatar01Model36.dispose();
    avatar01Model37.dispose();
    avatar01Model38.dispose();
    avatar01Model39.dispose();
    avatar01Model40.dispose();
  }
}
