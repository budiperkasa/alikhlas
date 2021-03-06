<?php
/*
 * Presets
 */

$default_preset = array();

$warp->config->addPreset('default', 'Default', array_merge($default_preset,array(
	'color' => 'default'
)));

$warp->config->addPreset('plainsky', 'Plain Sky',  array_merge($default_preset,array(
	'color' => 'plainsky'
)));

$warp->config->addPreset('plainmosaic', 'Plain Mosaic',  array_merge($default_preset,array(
	'color' => 'plainmosaic'
)));

$warp->config->addPreset('plainflowers', 'Plain Flowers',  array_merge($default_preset,array(
	'color' => 'plainflowers'
)));

$warp->config->addPreset('retrobeige', 'Retro Beige',  array_merge($default_preset,array(
	'color' => 'retrobeige'
)));

$warp->config->addPreset('retrolandscape', 'Retro Landscape',  array_merge($default_preset,array(
	'color' => 'retrolandscape'
)));

$warp->config->addPreset('retropaper', 'Retro Paper',  array_merge($default_preset,array(
	'color' => 'retropaper'
)));

$warp->config->addPreset('gradientblue', 'Gradient Blue',  array_merge($default_preset,array(
	'color' => 'gradientblue'
)));

$warp->config->addPreset('gradientbusiness', 'Gradient Business',  array_merge($default_preset,array(
	'color' => 'gradientbusiness'
)));

$warp->config->addPreset('gradientred', 'Gradient Red',  array_merge($default_preset,array(
	'color' => 'gradientred'
)));

$warp->config->addPreset('gradientribbon', 'Gradient Ribbon',  array_merge($default_preset,array(
	'color' => 'gradientribbon'
)));

$warp->config->addPreset('gradientspace', 'Gradient Space',  array_merge($default_preset,array(
	'color' => 'gradientspace'
)));

$warp->config->applyPreset();