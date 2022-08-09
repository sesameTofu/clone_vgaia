import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile/global/app_text_style.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:get/get.dart';

class BuildInputText extends StatefulWidget {
  const BuildInputText({
    Key? key,
    this.iconLeading,
    this.widgetLeading,
    required this.hintText,
    required this.controller,
    this.currentNode,
    this.submitFunc,
    this.obscureText = false,
    this.iconNextTextInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.maxLengthInputForm = 100,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.fontSize = 14,
    this.suffixIcon,
    this.fillColor,
    this.scrollPadding,
    this.textAlign,
    this.styleText,
    this.hintStyle,
    this.clearText,
    this.suffixText,
    this.contentPadding,
    this.useSuffix = false,
    this.padLeading,
    this.prefixIconConstraints,
  }) : super(key: key);

  final EdgeInsets? scrollPadding;

  /// [fillColor] Màu nền
  final Color? fillColor;

  final EdgeInsets? padLeading;

  final IconData? iconLeading;

  final Widget? widgetLeading;

  final String hintText;

  final TextEditingController controller;

  final FocusNode? currentNode;

  /// [obscureText] cho phép ẩn Text trong trường hợp Password, Mặc định `false` show text
  final bool obscureText;

  /// [isReadOnly] chỉ đọc
  final bool isReadOnly;

  final Function? submitFunc;

  /// [iconNextTextInputAction] mặc định là `next`, là icon/text tại vị trí nút enter trên bàn phím.
  ///  `done` , `go` ,`search` , `send`, `next`, `newline` thường hay dùng
  final TextInputAction iconNextTextInputAction;

  /// [inputFormatters] giúp format text đc nhập vào, ví dụ: '1,000,000'
  final List<TextInputFormatter>? inputFormatters;

  /// [textCapitalization] mặc định `sentences` là kiểu chữ khi Bàn hiển thị.
  /// `sentences`: Viết hoa chữ cái đâù dòng,  vd: 'Xin chào'
  /// `words`: Viết hoa đầu các chữ, vd: 'Xin Chào'
  /// `characters`: Viết hoa toàn bộ, vd: 'XIN CHÀO"
  /// `none`: Viết thường toàn bộ
  final TextCapitalization textCapitalization;

  /// [textInputType] mặc định `text`, là Bàn phím sẽ hiển thị các kí tự giúp nhập SMART hơn cho các trường hợp.
  /// `datetime`, `number`, `phone`: Bàn phím số
  /// `emailAddress`: Bàn phím có kí tự '@' '.com'
  /// `url`: Bàn phím có kí tự '/' 'www.'
  /// Còn lại đề là bàn phím bình thường
  final TextInputType textInputType;

  /// [maxLengthInputForm] số kí tự có thể nhập,  mặc định `100`
  final int maxLengthInputForm;

  final Function(String)? onChanged;

  final Widget? suffixIcon;

  final int maxLines;

  final double fontSize;

  final TextStyle? styleText;
  final TextStyle? hintStyle;

  final TextAlign? textAlign;
  final Function()? clearText;

  final String? suffixText;
  final EdgeInsets? contentPadding;

  ///[useSuffix] //  position icon in top right
  final bool useSuffix;

  final BoxConstraints? prefixIconConstraints;

  @override
  _BuildInputTextState createState() => _BuildInputTextState();
}

class _BuildInputTextState extends State<BuildInputText> {
  final RxBool _isShowButtonClear = false.obs;
  final RxBool _isShowText = false.obs;

  @override
  void initState() {
    super.initState();
    _isShowText.value = widget.obscureText;
    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty) {
        _isShowButtonClear.value = true;
      }
    });
    // auto trim() text input
    widget.currentNode?.addListener(() {
      if (widget.currentNode?.hasFocus == false) {
        widget.controller.text = widget.controller.text.trim();
      }
    });
  }

  @override
  void setState(Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() => setState(() {}));
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 27),
      child: TextFormField(
        scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
        textCapitalization: widget.textCapitalization,
        maxLines: widget.maxLines,
        maxLength: widget.maxLengthInputForm,
        inputFormatters: widget.inputFormatters,
        textAlign: widget.textAlign ?? TextAlign.start,
        enabled: !widget.isReadOnly,
        style: widget.styleText ??
            AppTextStyle().custom(
                size: widget.fontSize,
                color: Get.find<AppThemeBase>().theme.grey0,
                fontWeight: FontWeight.w400),
        onChanged: (String v) {
          if (!_isShowButtonClear.value || v.isEmpty) {
            _isShowButtonClear.value = v.isNotEmpty;
          }
          widget.onChanged?.call(v);
        },
        textInputAction: widget.iconNextTextInputAction,
        controller: widget.controller,
        obscureText: _isShowText.value,
        focusNode: widget.currentNode,
        keyboardType: widget.textInputType,
        onFieldSubmitted: (String v) {
          if (widget.submitFunc != null) {
            widget.submitFunc!();
          } else {
            if (widget.currentNode != null) {
              widget.currentNode!.unfocus();
            }
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          // hintText
          hintStyle: widget.hintStyle ??
              AppTextStyle().custom(
                  size: widget.fontSize,
                  color: Get.find<AppThemeBase>().theme.grey40,
                  fontWeight: FontWeight.w400),
          hintText: widget.hintText,
          // bg color
          fillColor: widget.fillColor ?? Get.find<AppThemeBase>().theme.grey80,
          filled: true,
          // contentPadding
          isDense: true,
          contentPadding: widget.contentPadding ?? EdgeInsets.all(10),
          // prefix
          prefixIcon: _buildPrefixIcon,
          prefixIconConstraints: widget.prefixIconConstraints ??
              BoxConstraints(maxWidth: 40, maxHeight: 40),
          // suffix
          suffixIcon: widget.useSuffix || widget.suffixText != null
              ? null
              : _buildSuffixIcon,
          suffix: !widget.useSuffix || widget.suffixText != null
              ? null
              : _buildSuffixIcon,
          suffixText: widget.suffixText,
          suffixIconConstraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
          // hide counter
          counterStyle: TextStyle(height: double.minPositive),
          counterText: '',
          // border
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Get.find<AppThemeBase>().theme.grey70),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Get.find<AppThemeBase>().theme.background3),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Get.find<AppThemeBase>().theme.background3)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Get.find<AppThemeBase>().theme.primary)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Get.find<AppThemeBase>().theme.background3)),
        ),
      ),
    );
  }

  Widget? get _buildPrefixIcon {
    return widget.widgetLeading == null && widget.iconLeading == null
        ? null
        : Padding(
            padding: widget.padLeading ??
                const EdgeInsets.symmetric(horizontal: 8.0),
            child: widget.iconLeading != null
                ? Icon(
                    widget.iconLeading,
                    color: Colors.grey,
                  )
                : widget.widgetLeading,
          );
  }

  Widget? get _buildSuffixIcon {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }
    if (!_isShowButtonClear.value || widget.isReadOnly) {
      return null;
    }
    return widget.obscureText
        ? InkWell(
            onTap: () {
              setState(() {
                _isShowText.toggle();
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Icon(
                _isShowText.value ? Icons.remove_red_eye : Icons.visibility_off,
                color: Colors.grey,
                size: 20,
              ),
            ),
          )
        : Visibility(
            visible: _isShowButtonClear.value && !widget.isReadOnly,
            child: InkWell(
              onTap: () {
                widget.controller.clear();
                _isShowButtonClear.value = false;
                if (widget.clearText != null) {
                  widget.clearText!();
                }
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.useSuffix ? 0 : 14),
                child: Icon(
                  Icons.cancel,
                  color: Colors.grey,
                  size: 16,
                ),
              ),
            ),
          );
  }
}
