package Vimana;

use warnings;
use strict;
use Vimana::Index;

use vars qw($INDEX);

=head1 NAME

Vimana - A Port manager for Vim

=head1 VERSION

Version 0.04

=cut

our $VERSION = '0.04';

=head1 DESCRIPTION

Vimana , stands for ( Vim script Manager ) , is an easy to use system for
searching , installing, and downloading vim script.

Vimana provides a command-line interface such like C<aptitude> programe on
Debian linux, for you to search , download , install scripts from
L<http://www.vim.org> (vimonline site).

Vimana can install a vim script package to your vim runtime path automatically
by inspecting the content of archive file or vim script. for example , if an
archive file contains 'syntax','plugin','indent' directory , then these files
should be installed to F<~/.vim/> directory.   if it's a vim color scheme ,
then it should be put into F<~/.vim/colors/> and prompt for setting the
installed colorscheme as default.

We plan to provide port files on git repository, vimrc customization and
internationalization in future.

( In some modern Indian languages, vimāna or vimān means "aircraft". )

=head1 FUNCTIONS

=cut

sub index {
    return $INDEX if $INDEX;
    $INDEX ||= Vimana::Index->new;
    $INDEX->init();
    unless ( $INDEX->get() ) {
        require Vimana::Command::Update;
        my $index = Vimana::Command::Update->fetch_index();
        $INDEX->update( $index );
    }
    return $INDEX;
}


=head1 AUTHOR

Cornelius ( You-An Lin ) C<< <cornelius at cpan.org> >>

=head2 Vimana Git Repository 

C<http://github.com/c9s/Vimana/tree/master>

=head1 BUGS

Please report any bugs or feature requests to C<bug-vim-get at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Vimana>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 TODOS

* auto rating

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Vimana


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Vimana>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Vimana>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Vimana>

=item * Search CPAN

L<http://search.cpan.org/dist/Vimana>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2007 Cornelius, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Vimana