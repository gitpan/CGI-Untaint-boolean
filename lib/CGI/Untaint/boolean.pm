package CGI::Untaint::boolean;

use strict;
use vars '$VERSION';

$VERSION = '0.11';

use base 'CGI::Untaint::object';

sub _untaint_re { qr/^(on)$/ }

sub is_valid
{
	my $self  = shift;
	my $value = $self->value();

	return unless $value and $value =~ $self->_untaint_re();

	$self->value( $value eq 'on' ? 1 : 0 );
	return 1;
}

1;
__END__

=head1 NAME

CGI::Untaint::boolean - untaint boolean values from CGI programs

=head1 SYNOPSIS

  use CGI::Untaint;

  my $handler = CGI::Untaint->new( $q->Vars() );
  my $boolean = $handler->extract( -as_boolean => 'some_feature' );

=head1 DESCRIPTION

This input handler verifies that it is dealing with a reasonable boolean value,
probably from a checkbox with no value specified.  In this case, "reasonable"
means that the value is C<on>, if the checkbox is checked, or empty, if the
client did not send a value.

B<Note:> the C<value()> method will return either 1 or 0, not C<on> or the
empty string.  It's boolean for a reason!

=head1 SEE ALSO

L<CGI::Untaint>, L<CGI::Untaint::object>

=head1 AUTHOR

chromatic, E<lt>chromatic@wgz.orgE<gt>

Thanks to Tony Bowden for helpful suggestions.

=head1 BUGS

No known bugs.  Please report any to L<http://rt.cpan.org/>.

=head1 COPYRIGHT

Copyright (c) 2004, chromatic.  All rights reserved.  This module is
distributed under the same terms as Perl itself, in the hope that it is useful
but certainly under no guarantee.
