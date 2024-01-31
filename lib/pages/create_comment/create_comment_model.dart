import '/flutter_flow/flutter_flow_util.dart';
import 'create_comment_widget.dart' show CreateCommentWidget;
import 'package:flutter/material.dart';

class CreateCommentModel extends FlutterFlowModel<CreateCommentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for commentText widget.
  FocusNode? commentTextFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentTextFocusNode?.dispose();
    commentTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
