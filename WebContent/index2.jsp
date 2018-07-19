
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
   <script type="text/ecmascript" src="js/jquery.min.js"></script> 
   <script type="text/ecmascript" src="js/trirand/jquery.jqGrid.min.js"></script>
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="js/trirand/i18n/grid.locale-en.js"></script>
    <!-- This is the Javascript file of jqGrid -->   
    <script type="text/ecmascript" src="js/trirand/jquery.jqGrid.min.js"></script>
    <script rel="stylesheet" type="text/css" media="screen"  src="css/trirand/ui.jqgrid-bootstrap.css"></script>



</head>
<body>

  <div>
        <div id="Grid2" style="width: 500px; height: 30px;"></div>
        <table id="myGrid"></table>
			<div id="myGridPager"></div>
    </div>


<script type="text/javascript">

function getColNames(data) {
    var keys = [];
    for(var key in data) {
        if (data.hasOwnProperty(key)) {
            keys.push(key);
        }
    }

    return keys;
}

function  getColModels(data) {
    var colNames= getColNames(data);
    var colModelsArray = [];
    for (var i = 0; i < colNames.length; i++) {
        var str;
        if (i === 0) {
            str = {
                name: colNames[i],
                index:colNames[i],
                key:true,
                editable:true
            };
        } else {
            str = {
                name: colNames[i],
                index:colNames[i],
                editable:true
            };
        }
        colModelsArray.push(str);
    }

    return colModelsArray;
}
jQuery(document).ready(function(){
	url="http://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=jqgrid&site=stackoverflow"
		secondFetchURL=url
$.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
    async: false,
    success: function (result) {
    	
    	

        if (result) {

            if (!result.Error) {
            	 colNames=getColNames(result.items[0])
                 colModel=getColModels(result.items[0])




                $("#myGrid").jqGrid({ datatype: 'local',
                    colModel: colModel,
                    colNames: colNames,
                    data: result.items,
                    height: "auto",
                    rowNum: 10,
                    //sortname: """,
                    //sortorder: "desc",
                    pager: '#myGridPager',
                    //caption: "Side-by-Side View",
                    viewrecords: true,
                    gridview: true
                });


            }
        }
    },
    error: function (xhr, ajaxOptions, thrownError) {
        if (xhr && thrownError) {
            alert('Status: ' + xhr.status + ' Error: ' + thrownError);
        }
    },
    complete: function () {
        $("#loadingDiv").hide();
    }
});
});
</script>

</body>
</html>
