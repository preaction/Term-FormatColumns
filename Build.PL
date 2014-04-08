
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Format lists of data into columns across the terminal's width",
  "dist_author" => [
    "Doug Bell <preaction\@cpan.org>"
  ],
  "dist_name" => "Term-FormatColumns",
  "dist_version" => "0.005",
  "license" => "perl",
  "module_name" => "Term::FormatColumns",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "List::MoreUtils" => "0.33",
    "Sub::Exporter" => "0.984",
    "Term::ReadKey" => "2.30"
  },
  "script_files" => [],
  "test_requires" => {
    "Test::Compile" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
