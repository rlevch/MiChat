import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  String authUserPhotoURL =
      'https://firebasestorage.googleapis.com/v0/b/mi-chat-qbul4q.appspot.com/o/defaultValues%2Fimage_is_empty_circle.jpeg?alt=media&token=410675d9-8418-40b4-a222-d78ed4b7d27a';

  String authUserName = 'Add a name....';

  bool isAddUserNameVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for AddUserName widget.
  FocusNode? addUserNameFocusNode;
  TextEditingController? addUserNameController;
  String? Function(BuildContext, String?)? addUserNameControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    addUserNameFocusNode?.dispose();
    addUserNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
