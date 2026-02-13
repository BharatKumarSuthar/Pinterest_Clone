class SearchBarState {
  final bool isFocused;
  final bool hasText;
  const SearchBarState({this.isFocused = true, this.hasText = false});

  SearchBarState copyWith({bool? isFocused, bool? hasText}) {
    return SearchBarState(
      isFocused: isFocused ?? this.isFocused,
      hasText: hasText ?? this.hasText,
    );
  }
}
