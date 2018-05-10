
{% set site_root = config.root %}

{% set logo = parse_config([site.data.cutie.logo, theme.logo]) %} 

<header id="header" class='header'>
	<div class="header-title">
		{% if logo %}
		<div class='header-logo'>
			<a href="{{site_root}}">
				<img src='{{ logo }}' />
			</a>
		</div>
		<div class='header-text'>
			<h1>
				<a href="{{site_root}">{{ config.title }}</a>
			</h1>
			<subtitle>
				{{ truncate(config.subtitle, {length: 40, separator: ' ', omission: '...'}) }}
			</subtitle>
		</div>
		{% else %}
		<div class='header-text-no-image'>
			<h1>
				<a href="{{site_root}}">{{ config.title }}</a>
			</h1>
			<subtitle>{{ truncate(config.subtitle, {length: 40, separator: ' ', omission: '...'}) }}</subtitle>
		</div>
		{% endif %}
	</div>
	<div id='header-nav'>
		{{ partial('_partial/nav', {position: 'header'}) }}
	</div>
</header>