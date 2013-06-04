/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

// 此文件不是使用ckeditor时必须有的，可以安全地忽略。
// 它只是一个辅助文件，显示浏览器的兼容性

if ( window.CKEDITOR )
{
	(function()
	{
		var showCompatibilityMsg = function()
		{
			var env = CKEDITOR.env;

			var html = '<p><strong>您的浏览器不兼容ckeditor插件.</strong>';

			var browsers =
			{
				gecko : 'Firefox 2.0',
				ie : 'Internet Explorer 6.0',
				opera : 'Opera 9.5',
				webkit : 'Safari 3.0'
			};

			var alsoBrowsers = '';

			for ( var key in env )
			{
				if ( browsers[ key ] )
				{
					if ( env[key] )
						html += ' CKEditor兼容 ' + browsers[ key ] + ' 或更高版本.';
					else
						alsoBrowsers += browsers[ key ] + '+, ';
				}
			}

			alsoBrowsers = alsoBrowsers.replace( /\+,([^,]+), $/, '+ and $1' );

			html += ' 它也兼容 ' + alsoBrowsers + '.';

			html += '</p><p>浏览器不兼容的情况，您仍然可以在一个纯文本字段中编辑内容（文本）</p>';

			var alertsEl = document.getElementById( 'alerts' );
			alertsEl && ( alertsEl.innerHTML = html );
		};

		var onload = function()
		{
			// 一旦加载页面显示友好的兼容性信息，如果浏览器不支持CkEditor
			if ( !CKEDITOR.env.isCompatible )
				showCompatibilityMsg();
		};

		// 注册监听器
		if ( window.addEventListener )
			window.addEventListener( 'load', onload, false );
		else if ( window.attachEvent )
			window.attachEvent( 'onload', onload );
	})();
}
