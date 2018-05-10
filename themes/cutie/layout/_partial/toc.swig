
{% set site_root = config.root %}

{% set toc_level = parse_config([page.toc_level, site.data.cutie.post.toc_level, theme.post.toc_level]) %}

{{ toc(page.content, {list_number: true, max_depth: toc_level}) }}
<div class="toc-button" onclick='toggleTOC(event);' ontouchstart='toggleTOC(event);'>
    <img src="{{ site_root + 'images/icons/' + icon_set + '/toc.svg' }}" alt="">
</div>
