import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'create_comment_model.dart';
export 'create_comment_model.dart';

class CreateCommentWidget extends StatefulWidget {
  const CreateCommentWidget({
    super.key,
    required this.currentPost,
  });

  final DocumentReference? currentPost;

  @override
  State<CreateCommentWidget> createState() => _CreateCommentWidgetState();
}

class _CreateCommentWidgetState extends State<CreateCommentWidget> {
  late CreateCommentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateCommentModel());

    _model.commentTextController ??= TextEditingController();
    _model.commentTextFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: FFButtonWidget(
          onPressed: () async {
            context.pop();
          },
          text: 'Cancel',
          options: FFButtonOptions(
            width: 80.0,
            height: 40.0,
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).labelMedium,
            elevation: 0.0,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
            child: FFButtonWidget(
              onPressed: () async {
                await CommentsRecord.collection.doc().set({
                  ...createCommentsRecordData(
                    user: currentUserReference,
                    comment: _model.commentTextController.text,
                    post: widget.currentPost,
                  ),
                  ...mapToFirestore(
                    {
                      'posted': FieldValue.serverTimestamp(),
                    },
                  ),
                });
                context.safePop();
              },
              text: 'Send',
              options: FFButtonOptions(
                width: 70.0,
                height: 32.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                elevation: 2.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondary,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 40.0,
                          height: 40.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            currentUserPhoto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                        Text(
                          currentUserEmail,
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: TextFormField(
                  controller: _model.commentTextController,
                  focusNode: _model.commentTextFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.commentTextController',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Write a comment',
                    hintStyle: FlutterFlowTheme.of(context).labelLarge,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                  textAlign: TextAlign.start,
                  maxLines: 7,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  validator: _model.commentTextControllerValidator
                      .asValidator(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
