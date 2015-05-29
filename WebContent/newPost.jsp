<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>
	<%@ include file="includeHead.jsp"%>
	
	<!-- Title of the page -->
	<title>New post</title>
	
	<!-- TinyFCK integration -->
	<script type="text/javascript" src="tinyfck/tiny_mce.js"></script>
	<script type="text/javascript">
	    tinyMCE.init({
	        mode : "textareas",
	        plugins : "style,table,advhr,advimage,advlink,emotions,insertdatetime,preview,zoom,flash,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable",
	        theme_advanced_buttons1_add_before : "save,newdocument,separator",
	        theme_advanced_buttons1_add : "fontselect,fontsizeselect",
	        theme_advanced_buttons2_add : "separator,insertdate,inserttime,preview,separator,forecolor,backcolor",
	        theme_advanced_buttons2_add_before: "cut,copy,paste,pastetext,pasteword,separator,search,replace,separator",
	        theme_advanced_buttons3_add_before : "tablecontrols,separator",
	        theme_advanced_buttons3_add : "emotions,iespell,flash,advhr,separator,print,separator,ltr,rtl,separator,fullscreen",
	        theme_advanced_toolbar_location : "top",
	        theme_advanced_toolbar_align : "left",
	        theme_advanced_path_location : "bottom",
	        content_css : "/example_data/example_full.css",
	        plugin_insertdate_dateFormat : "%Y-%m-%d",
	        plugin_insertdate_timeFormat : "%H:%M:%S",
	        extended_valid_elements : "hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
	        external_link_list_url : "example_data/example_link_list.js",
	        external_image_list_url : "example_data/example_image_list.js",
	        flash_external_list_url : "example_data/example_flash_list.js",
	        file_browser_callback : "fileBrowserCallBack",
	        theme_advanced_resize_horizontal : false,
	        theme_advanced_resizing : true,
	        apply_source_formatting : true
	        //language : "zh_cn_utf8"
	    });
	        
	    function fileBrowserCallBack(field_name, url, type, win) {
	        var connector = "../../filemanager/browser.html?Connector=connectors/jsp/connector";
	        var enableAutoTypeSelection = true;
	 
	        var cType;
	        tinyfck_field = field_name;
	        tinyfck = win;
	    
	        switch (type) {
	            case "image":
	                cType = "Image";
	                break;
	            case "flash":
	                cType = "Flash";
	                break;
	            case "file":
	                cType = "File";
	                break;
	        }
	    
	        if (enableAutoTypeSelection && cType) {
	            connector += "&Type=" + cType;
	        }
	        window.open(connector, "tinyfck", "modal,width=600,height=400");
	    }
	</script>
	<!-- /TinyFCK integtation -->
	
</head>


<body>

	<%@ include file="includeNav.jsp"%>
	
	<div class="container">
		<div class="col-sm-12">
			<h1 class="text-center" id="id-newpost-title">New post</h1>
		</div>
		<div class="col-sm-8 col-sm-offset-2">
			<form method="post" action="pushPostServlet">
				<div class="row form-group">
					<input type="text" class="form-control" id="id-post-title"
						placeholder="Title" name="postTitle" />
				</div>
				<div class="row form-group">
					<textarea id="id-editor" name="postContent" style="width: 100%; height: 100%"></textarea>
				</div>
				<div class="row form-group" id="id-newpost-button">
					<button type="submit" class="btn btn-primary">Post!</button>
				</div>
			</form>
		</div>
	</div>
	
	<%@ include file="includeFooter.jsp" %>
	
	<!-- Bootstrap JavaSrcipt resources -->
	<script src="js/jQuery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>

</html>