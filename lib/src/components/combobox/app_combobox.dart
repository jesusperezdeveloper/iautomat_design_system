import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'combobox_config.dart';

class AppComboBox<T> extends StatefulWidget {
  final String? query;
  final ValueChanged<String>? onQueryChanged;
  final List<AppComboBoxSuggestion<T>> suggestions;
  final ValueChanged<AppComboBoxSuggestion<T>>? onSelected;
  final String? placeholder;
  final String? label;
  final String? helperText;
  final String? errorText;
  final String? Function(String?)? validator;
  final AppComboBoxVariant variant;
  final AppComboBoxConfig? config;
  final AppComboBoxColors? colors;
  final bool enabled;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? semanticLabel;
  final AppComboBoxState? overrideState;
  final TextDirection? textDirection;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool dense;
  final double? width;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? noResultsText;
  final Widget? loadingWidget;
  final Future<List<AppComboBoxSuggestion<T>>> Function(String)? onQuerySubmitted;

  const AppComboBox({
    super.key,
    this.query,
    this.onQueryChanged,
    this.suggestions = const [],
    this.onSelected,
    this.placeholder,
    this.label,
    this.helperText,
    this.errorText,
    this.validator,
    this.variant = AppComboBoxVariant.typeahead,
    this.config,
    this.colors,
    this.enabled = true,
    this.autoFocus = false,
    this.focusNode,
    this.controller,
    this.semanticLabel,
    this.overrideState,
    this.textDirection,
    this.prefixIcon,
    this.suffixIcon,
    this.dense = false,
    this.width,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.noResultsText,
    this.loadingWidget,
    this.onQuerySubmitted,
  }) : assert(
    onQueryChanged != null || controller != null,
    'Either onQueryChanged or controller must be provided',
  );

  @override
  State<AppComboBox<T>> createState() => _AppComboBoxState<T>();
}

class _AppComboBoxState<T> extends State<AppComboBox<T>> with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  late AnimationController _animationController;
  late AnimationController _skeletonAnimationController;
  late Animation<double> _skeletonAnimation;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  Timer? _debounceTimer;
  Timer? _loadingTimer;

  late AppComboBoxConfig _config;
  late AppComboBoxColors _colors;
  AppComboBoxState _currentState = AppComboBoxState.defaultState;

  bool _isHovered = false;
  bool _isFocused = false;
  final bool _isPressed = false;
  bool _isSuggestionsOpen = false;
  bool _isLoading = false;
  List<AppComboBoxSuggestion<T>> _filteredSuggestions = [];
  String _lastQuery = '';
  int _selectedSuggestionIndex = -1;

  bool get _isEnabled => widget.enabled && widget.overrideState != AppComboBoxState.disabled;
  bool get _hasError => widget.errorText != null || _effectiveErrorText != null;
  String? get _effectiveErrorText => widget.errorText ?? _validationError;
  String? _validationError;

  String get _currentQuery => widget.controller?.text ?? widget.query ?? '';

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController(text: widget.query);
    _focusNode.addListener(_handleFocusChange);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _skeletonAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _skeletonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _skeletonAnimationController,
      curve: Curves.easeInOut,
    ));

    _updateConfig();

    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateColors();
    _updateState();
    _updateFilteredSuggestions();

    if (widget.overrideState == AppComboBoxState.skeleton) {
      _skeletonAnimationController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(AppComboBox<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    _updateConfig();
    _updateColors();
    _updateState();

    if (oldWidget.suggestions != widget.suggestions) {
      _updateFilteredSuggestions();
    }

    if (oldWidget.query != widget.query && widget.controller == null) {
      _controller.text = widget.query ?? '';
      _updateFilteredSuggestions();
    }

    if (oldWidget.overrideState != widget.overrideState) {
      if (_currentState == AppComboBoxState.skeleton) {
        _skeletonAnimationController.repeat(reverse: true);
      } else {
        _skeletonAnimationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.controller == null) {
      _controller.dispose();
    }
    _closeSuggestions();
    _animationController.dispose();
    _skeletonAnimationController.dispose();
    _debounceTimer?.cancel();
    _loadingTimer?.cancel();
    super.dispose();
  }

  void _updateConfig() {
    _config = widget.config ?? const AppComboBoxConfig();
  }

  void _updateColors() {
    final theme = Theme.of(context);
    _colors = widget.colors ?? AppComboBoxColors.fromTheme(theme);
  }

  void _updateState() {
    if (widget.overrideState != null) {
      _currentState = widget.overrideState!;
      return;
    }

    if (!_isEnabled) {
      _currentState = AppComboBoxState.disabled;
    } else if (_hasError) {
      _currentState = AppComboBoxState.error;
    } else if (_isFocused) {
      _currentState = AppComboBoxState.focus;
    } else if (_isPressed) {
      _currentState = AppComboBoxState.pressed;
    } else if (_isHovered) {
      _currentState = AppComboBoxState.hover;
    } else {
      _currentState = AppComboBoxState.defaultState;
    }
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      _updateState();
    });

    if (!_isFocused && _isSuggestionsOpen) {
      _closeSuggestions();
    }
  }

  void _handleQueryChanged(String query) {
    if (widget.onQueryChanged != null) {
      widget.onQueryChanged!(query);
    }

    if (query != _lastQuery) {
      _lastQuery = query;
      _debounceTimer?.cancel();

      if (query.length >= _config.minQueryLength) {
        _debounceTimer = Timer(Duration(milliseconds: _config.typeaheadDebounceMs), () {
          _performSearch(query);
        });
      } else {
        _updateFilteredSuggestions();
        if (_isSuggestionsOpen) {
          _closeSuggestions();
        }
      }
    }

    _validate();
  }

  void _performSearch(String query) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _selectedSuggestionIndex = -1;
    });

    try {
      if (widget.onQuerySubmitted != null) {
        final results = await widget.onQuerySubmitted!(query);
        if (mounted && query == _currentQuery) {
          setState(() {
            _filteredSuggestions = results.take(_config.maxSuggestions).toList();
            _isLoading = false;
          });
          _showSuggestions();
        }
      } else {
        _updateFilteredSuggestions();
        setState(() {
          _isLoading = false;
        });
        _showSuggestions();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _filteredSuggestions = [];
          _isLoading = false;
        });
      }
    }
  }

  void _updateFilteredSuggestions() {
    final query = _currentQuery;
    if (query.length < _config.minQueryLength) {
      _filteredSuggestions = [];
      return;
    }

    _filteredSuggestions = widget.suggestions
        .where((suggestion) => suggestion.matches(
              query,
              caseSensitive: _config.caseSensitive,
              trimWhitespace: _config.trimWhitespace,
            ))
        .take(_config.maxSuggestions)
        .toList();
  }

  void _showSuggestions() {
    if (_isSuggestionsOpen || _filteredSuggestions.isEmpty) return;

    _isSuggestionsOpen = true;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _closeSuggestions() {
    if (!_isSuggestionsOpen) return;

    _isSuggestionsOpen = false;
    _animationController.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
    _selectedSuggestionIndex = -1;
  }

  void _handleSuggestionSelected(AppComboBoxSuggestion<T> suggestion) {
    if (widget.onSelected != null) {
      widget.onSelected!(suggestion);
    }

    if (_config.clearOnSelection) {
      _controller.clear();
      if (widget.onQueryChanged != null) {
        widget.onQueryChanged!('');
      }
    } else {
      _controller.text = suggestion.label;
      if (widget.onQueryChanged != null) {
        widget.onQueryChanged!(suggestion.label);
      }
    }

    if (_config.dismissOnSelection) {
      _closeSuggestions();
      _focusNode.unfocus();
    }

    if (_config.enableHapticFeedback && (Platform.isIOS || Platform.isAndroid)) {
      HapticFeedback.selectionClick();
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _selectNextSuggestion();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _selectPreviousSuggestion();
      } else if (event.logicalKey == LogicalKeyboardKey.enter) {
        _selectCurrentSuggestion();
      } else if (event.logicalKey == LogicalKeyboardKey.escape) {
        _closeSuggestions();
      }
    }
  }

  void _selectNextSuggestion() {
    if (!_isSuggestionsOpen || _filteredSuggestions.isEmpty) return;

    setState(() {
      _selectedSuggestionIndex = (_selectedSuggestionIndex + 1) % _filteredSuggestions.length;
    });
  }

  void _selectPreviousSuggestion() {
    if (!_isSuggestionsOpen || _filteredSuggestions.isEmpty) return;

    setState(() {
      _selectedSuggestionIndex = _selectedSuggestionIndex <= 0
          ? _filteredSuggestions.length - 1
          : _selectedSuggestionIndex - 1;
    });
  }

  void _selectCurrentSuggestion() {
    if (!_isSuggestionsOpen ||
        _filteredSuggestions.isEmpty ||
        _selectedSuggestionIndex < 0 ||
        _selectedSuggestionIndex >= _filteredSuggestions.length) {
      return;
    }

    _handleSuggestionSelected(_filteredSuggestions[_selectedSuggestionIndex]);
  }

  void _validate() {
    if (widget.validator != null) {
      setState(() {
        _validationError = widget.validator!(_currentQuery);
      });
    }
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + _config.suggestionsOffset),
          child: Material(
            elevation: _config.enableSuggestionsElevation ? _config.suggestionsElevation : 0,
            borderRadius: BorderRadius.circular(_config.borderRadius),
            color: _colors.suggestionsBackgroundColor,
            shadowColor: _colors.suggestionsShadowColor,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 0.8 + (_animationController.value * 0.2),
                  alignment: Alignment.topCenter,
                  child: Opacity(
                    opacity: _animationController.value,
                    child: _buildSuggestionsContent(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionsContent() {
    if (_isLoading && _config.showLoadingIndicator) {
      return Container(
        height: _config.suggestionItemHeight,
        padding: _config.contentPadding,
        child: Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: _buildLoadingIndicator(),
            ),
            const SizedBox(width: 12),
            Text(
              'Buscando...',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _colors.suggestionItemTextColor,
              ),
            ),
          ],
        ),
      );
    }

    if (_filteredSuggestions.isEmpty) {
      if (_config.showNoResultsMessage && _currentQuery.isNotEmpty) {
        return Container(
          height: _config.suggestionItemHeight,
          padding: _config.contentPadding,
          child: Text(
            widget.noResultsText ?? 'No se encontraron resultados',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _colors.noResultsTextColor,
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: _config.maxSuggestionsHeight,
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: _filteredSuggestions.length,
        itemBuilder: (context, index) {
          final suggestion = _filteredSuggestions[index];
          final isSelected = index == _selectedSuggestionIndex;

          return _buildSuggestionItem(suggestion, isSelected, index);
        },
      ),
    );
  }

  Widget _buildSuggestionItem(AppComboBoxSuggestion<T> suggestion, bool isSelected, int index) {
    return Material(
      color: isSelected ? _colors.suggestionItemSelectedColor : _colors.suggestionItemBackgroundColor,
      child: InkWell(
        onTap: suggestion.enabled ? () => _handleSuggestionSelected(suggestion) : null,
        onHover: (hovering) {
          if (hovering && suggestion.enabled) {
            setState(() {
              _selectedSuggestionIndex = index;
            });
          }
        },
        child: Container(
          height: _config.suggestionItemHeight,
          padding: _config.contentPadding,
          child: Row(
            children: [
              if (suggestion.leading != null) ...[
                suggestion.leading!,
                SizedBox(width: _config.itemSpacing),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_config.highlightMatches && _currentQuery.isNotEmpty)
                      RichText(
                        text: TextSpan(
                          children: suggestion.getHighlightedLabel(
                            _currentQuery,
                            suggestion.enabled
                                ? _colors.suggestionItemTextColor
                                : _colors.suggestionItemDisabledTextColor,
                            _colors.highlightTextColor,
                          ),
                        ),
                      )
                    else
                      Text(
                        suggestion.label,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: suggestion.enabled
                              ? _colors.suggestionItemTextColor
                              : _colors.suggestionItemDisabledTextColor,
                        ),
                      ),
                    if (suggestion.subtitle != null)
                      Text(
                        suggestion.subtitle!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _colors.suggestionItemSubtitleColor,
                        ),
                      ),
                  ],
                ),
              ),
              if (suggestion.trailing != null) ...[
                SizedBox(width: _config.itemSpacing),
                suggestion.trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        color: _colors.loadingIndicatorColor,
      );
    }
    return CircularProgressIndicator(
      strokeWidth: 2,
      color: _colors.loadingIndicatorColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentState == AppComboBoxState.skeleton) {
      return _buildSkeleton();
    }

    if (_currentState == AppComboBoxState.loading) {
      return _buildLoadingField();
    }

    return _buildComboBox();
  }

  Widget _buildSkeleton() {
    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Container(
                width: 80,
                height: 14,
                decoration: BoxDecoration(
                  color: _colors.skeletonBaseColor.withValues(
                    alpha: 0.3 + (_skeletonAnimation.value * 0.3),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(height: _config.labelSpacing),
            ],
            Container(
              width: double.infinity,
              height: _config.minimumHeight,
              decoration: BoxDecoration(
                color: _colors.skeletonBaseColor.withValues(
                  alpha: 0.3 + (_skeletonAnimation.value * 0.3),
                ),
                borderRadius: BorderRadius.circular(_config.borderRadius),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingField() {
    return Semantics(
      label: widget.semanticLabel ?? widget.label,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null && !_config.enableFloatingLabel) ...[
            Text(
              widget.label!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _colors.labelColor,
              ),
            ),
            SizedBox(height: _config.labelSpacing),
          ],
          Container(
            width: widget.width,
            height: _config.minimumHeight,
            decoration: BoxDecoration(
              color: _colors.disabledFillColor,
              borderRadius: BorderRadius.circular(_config.borderRadius),
              border: Border.all(
                color: _colors.disabledBorderColor,
                width: _config.borderWidth,
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: _config.contentPadding.left),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: _buildLoadingIndicator(),
                ),
                const SizedBox(width: 12),
                Text(
                  'Cargando...',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _colors.disabledTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComboBox() {
    final theme = Theme.of(context);

    return Semantics(
      label: widget.semanticLabel ?? widget.label,
      textField: true,
      enabled: _isEnabled,
      focusable: _isEnabled,
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _isHovered = true;
          _updateState();
        }),
        onExit: (_) => setState(() {
          _isHovered = false;
          _updateState();
        }),
        child: CompositedTransformTarget(
          link: _layerLink,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.label != null && !_config.enableFloatingLabel) ...[
                Text(
                  widget.label!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _hasError
                        ? _colors.errorLabelColor
                        : _isFocused
                            ? _colors.focusedLabelColor
                            : _isEnabled
                                ? _colors.labelColor
                                : _colors.disabledLabelColor,
                  ),
                ),
                SizedBox(height: _config.labelSpacing),
              ],
              _buildTextField(),
              if (_effectiveErrorText != null) ...[
                SizedBox(height: _config.helperErrorSpacing),
                Text(
                  _effectiveErrorText!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _colors.errorTextColor,
                  ),
                ),
              ] else if (widget.helperText != null) ...[
                SizedBox(height: _config.helperErrorSpacing),
                Text(
                  widget.helperText!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _colors.helperTextColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return SizedBox(
      width: widget.width,
      child: Focus(
        onKeyEvent: (node, event) {
          _handleKeyEvent(event);
          return KeyEventResult.ignored;
        },
        child: TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          enabled: _isEnabled,
          autofocus: widget.autoFocus,
          obscureText: widget.obscureText,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          textDirection: widget.textDirection,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: _isEnabled ? _colors.textColor : _colors.disabledTextColor,
          ),
          cursorColor: _colors.cursorColor,
          onChanged: _handleQueryChanged,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: TextStyle(
              color: _isEnabled ? _colors.hintColor : _colors.disabledHintColor,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: _buildSuffixIcon(),
            filled: true,
            fillColor: _isEnabled ? _colors.fillColor : _colors.disabledFillColor,
            contentPadding: _config.contentPadding,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_config.borderRadius),
              borderSide: BorderSide(
                color: _colors.borderColor,
                width: _config.borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_config.borderRadius),
              borderSide: BorderSide(
                color: _colors.borderColor,
                width: _config.borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_config.borderRadius),
              borderSide: BorderSide(
                color: _colors.focusedBorderColor,
                width: _config.focusBorderWidth,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_config.borderRadius),
              borderSide: BorderSide(
                color: _colors.errorBorderColor,
                width: _config.borderWidth,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_config.borderRadius),
              borderSide: BorderSide(
                color: _colors.errorBorderColor,
                width: _config.focusBorderWidth,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_config.borderRadius),
              borderSide: BorderSide(
                color: _colors.disabledBorderColor,
                width: _config.borderWidth,
              ),
            ),
            errorText: null, // We handle error text separately
            counterText: '', // Hide default counter
          ),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }

    if (_isLoading) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: 16,
          height: 16,
          child: _buildLoadingIndicator(),
        ),
      );
    }

    return Icon(
      Icons.search,
      size: _config.iconSize,
      color: _isEnabled ? _colors.iconColor : _colors.disabledIconColor,
    );
  }
}