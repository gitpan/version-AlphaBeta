#!/usr/bin/perl

use Module::Build;
my $class = Module::Build->subclass
(
    class => 'version::Builder',
    code => q{
    sub ACTION_Changes {
    	Module::Build->do_system('svn log -v | gnuify-changelog.pl > Changes' );
	}
    },
);

my $m = $class->new(
    module_name     => 'version::AlphaBeta',
    license         => 'perl',
    requires        => {version => '0.32',},
);
$m->create_build_script;
