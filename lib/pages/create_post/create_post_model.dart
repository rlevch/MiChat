import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for postTitle widget.
  FocusNode? postTitleFocusNode;
  TextEditingController? postTitleController;
  String? Function(BuildContext, String?)? postTitleControllerValidator;
  // State field(s) for postDescription widget.
  FocusNode? postDescriptionFocusNode;
  TextEditingController? postDescriptionController;
  String? Function(BuildContext, String?)? postDescriptionControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    postTitleFocusNode?.dispose();
    postTitleController?.dispose();

    postDescriptionFocusNode?.dispose();
    postDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
