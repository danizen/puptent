class ab_ruby::params {
  if ($hostname =~ /^d/) {
    $devel = true
  } else {
    $devel = nil
  }
}
