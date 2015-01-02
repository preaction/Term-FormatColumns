requires "List::MoreUtils" => "0.33";
requires "List::Util" => "0";
requires "POSIX" => "0";
requires "Sub::Exporter" => "0.984";
requires "Symbol" => "0";
requires "Term::ReadKey" => "2.30";
requires "strict" => "0";
requires "warnings" => "0";

on 'build' => sub {
  requires "Module::Build" => "0.28";
};

on 'test' => sub {
  requires "Test::Compile" => "0";
  requires "Test::More" => "0.88";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "Module::Build" => "0.28";
};
