
{% set site_root = config.root %}

{% if is_home() %}
  {% set announcement = parse_config([site.data.cutie.global.announcement, theme.global.announcement]) %}
{% elif is_post() %}
  {% set announcement = item.announcement %}
{% endif %}

{% if announcement %}
<script type='text/javascript' src='{{ theme.libs.noty.js_min }}'></script>
<script>
    loadjs(['{{ site_root + theme.libs.noty.js_min }}', '{{ site_root + theme.libs.jshashes.js_min }}', '{{ site_root + theme.libs.jscookie.js }}', '{{ site_root + "js/announcement.js" }}'], 'announcement');
    loadjs.ready('announcement', {
      success: function(){
        new Announcement('{{ announcement.text }}').show();
      },
      error: function(err){
        console.log(err);
      }
    });
</script>

<style>
  #announcement{
    width: 40vw;
    padding: 0.1em;
  }
  #announcement a:link{
    color: white
  }
  #announcement a:visited{
    color: white
  }
</style>
{% endif %}