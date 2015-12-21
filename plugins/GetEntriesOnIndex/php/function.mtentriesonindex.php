<?php
function smarty_function_mtentriesonindex($args, &$ctx) {
    $blog_fetch_args['blog_id'] = $ctx->stash('blog_id');
    $blog = $ctx->mt->db()->fetch_blogs($blog_fetch_args);
    return $blog[0]->entries_on_index;
}
