class SelectedRange {
  DateTime? start;
  DateTime? end;

  SelectedRange({
    this.start,
    this.end,
  });

  @override
  String toString() => 'SelectedRange($start, $end)';
}
