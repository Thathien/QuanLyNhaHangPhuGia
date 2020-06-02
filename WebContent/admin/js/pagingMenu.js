function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;
    
    this.showRecords = function(from, to) {        
        var rows = document.getElementById(tableName).rows;
        // i starts from 1 to skip table header row
        for (var i = 1; i < rows.length; i++) {
            if (i < from || i > to)  
                rows[i].style.display = 'none';
            else
                rows[i].style.display = '';
        }
        for (var i = 1; i < rows.length; i++) {
        	if (i < from || i > to)  
                rows[i].style.display = 'none';
        }
    }
    
    this.showPage = function(pageNumber) {
//    	var rows = document.getElementById(tableName).rows;
//    	for (var i = 2; i < row.length; i+=2) {
//    		rows[i].style.display = 'block';
//    	}
		//$("#tableName tr:not(.odd)").hide();
		//$("#foodtable tr:first-child").show();
    	if (! this.inited) {
    		alert("not inited");
    		return;
    	}

        var oldPageAnchor = document.getElementById('pg'+this.currentPage);
        oldPageAnchor.className = 'pg-normal';
        
        this.currentPage = pageNumber;
        var newPageAnchor = document.getElementById('pg'+this.currentPage);
        newPageAnchor.className = 'pg-selected';
        
        var from = (pageNumber - 1) * itemsPerPage + 1;
        var to = from + itemsPerPage - 1;
        this.showRecords(from, to);
    }   
    
    this.prev = function() {
        if (this.currentPage > 1)
            this.showPage(this.currentPage - 1);
    }
    
    this.next = function() {
        if (this.currentPage < this.pages) {
            this.showPage(this.currentPage + 1);
        }
    }                        
    
    this.init = function() {
        var rows = document.getElementById(tableName).rows;
        var records = (rows.length - 1); 
        this.pages = Math.ceil(records / itemsPerPage);
        this.inited = true;
    }

    this.showPageNav = function(pagerName, positionId) {
    	if (! this.inited) {
    		alert("not inited");
    		return;
    	}
    	var element = document.getElementById(positionId);
    	var btn_Prev = '<button type="button" class="btn btn-info"><</button>';
    	var btn_Next= '<button type="button" class="btn btn-info">></button>';
    	
    	
    	var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal style="margin:0;">'+btn_Prev+'</span>';
    	
        for (var page = 1; page <= this.pages; page++) 
            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' +'<button type="button" class="btn btn-default"><b>'+page+'</b></button>' + '</span>';

        pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal" style="margin:0;">'+btn_Next+'</span>';            
        
        element.innerHTML = pagerHtml;
    }
}

