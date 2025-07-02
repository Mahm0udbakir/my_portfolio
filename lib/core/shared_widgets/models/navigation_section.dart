/// Data model for navigation sections.
/// 
/// Represents a navigation section with a display label
/// and its corresponding index in the navigation order.
class Section {
  final String label;
  final int index;

  /// Creates a NavigationSection with the given label and index.
  /// 
  /// [label] The display name for the section.
  /// [index] The position/index of the section in navigation order.
  ///         Must be non-negative.
  const Section(this.label, this.index) : assert(index >= 0, 'Index must be non-negative');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Section && 
           other.label == label && 
           other.index == index;
  }

  @override
  int get hashCode => label.hashCode ^ index.hashCode;

  @override
  String toString() => 'NavigationSection(label: $label, index: $index)';
} 