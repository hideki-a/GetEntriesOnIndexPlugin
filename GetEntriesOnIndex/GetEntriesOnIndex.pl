package MT::Plugin::GetEntriesOnIndex;
use strict;

use vars qw( $MYNAME $VERSION );
$MYNAME = 'GetEntriesOnIndex';
$VERSION = '1.0.0';

use base qw( MT::Plugin );
my $plugin = __PACKAGE__->new({
    id => $MYNAME,
    key => $MYNAME,
    name => $MYNAME,
    version => $VERSION,
    author_name => 'Hideki Abe',
    author_link => 'http://www.skyward-design.net',
    doc_link => 'http://www.skyward-design.net/blog/archives/000131.html',
    description => "投稿設定の「表示される記事数（投稿数ベース）」の設定値を取得するプラグインです。"
});
MT->add_plugin( $plugin );
sub init_registry {
    my $plugin = shift;
    $plugin->registry({
         tags => {
            function => {
                  EntriesOnIndex => \&_get_entries_on_index,
            },
         },
    });
}

sub _get_entries_on_index {
    require MT::Blog;
    my ($ctx, $args) = @_;
    my $blog_id = $ctx->stash('blog_id');
    my $blog = MT::Blog->load($blog_id);
    return $blog->entries_on_index();
}

1;
