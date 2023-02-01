package com.finalproject.bada.common;


import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminPageFactory {
   
   public static String getPage(int cPage, int numPerpage, int totalData, String url, String searchType, String searchKeyword) {
	   
	   
	  //log.debug("cPage : {}", cPage);
      String pageBar="";
      int totalPage=(int)Math.ceil((double)totalData/numPerpage);
      int pageBarSize=5;
      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
      int pageEnd=pageNo+pageBarSize-1;
     
      
      pageBar="<span class='pagination justify-content-center pagination-sm'>";
      
      if(pageNo==1) {
         pageBar+="<span class='page-item disabled'>";
         pageBar+=" <a class='page-link' href='#'> 이전 </a>";
         pageBar+="</span>";
      }else {
         pageBar+="<span class='page-item'>";
         pageBar+=" <a class='page-link' href='javascript:fn_paging("+(pageNo-1);
         pageBar+=",\""+searchType+"\",\""+searchKeyword+"\");'>" 
         +"이전"+" </a>	";
         pageBar+="</span>";
      }
      
      while(!(pageNo>pageEnd||pageNo>totalPage)) {
         if(cPage==pageNo) {
            pageBar+="<span class='page-item disabled'>";
            pageBar+=" <a class='page-link' href='#'> "+pageNo+" </a>";
            pageBar+="</span>";
         }else {
            pageBar+="<span class='page-item'>";
            pageBar+=" <a class='page-link' href='javascript:fn_paging("+pageNo;
            pageBar+=",\""+searchType+"\",\""+searchKeyword+"\");'>" 
            +pageNo+" </a>	";
            pageBar+="</span>";
         }
         
         pageNo++;
      }
      
      if(pageNo>totalPage) {
         pageBar+="<span class='page-item disabled'>";
         pageBar+=" <a class='page-link' href='#'> 다음 </a>";
         pageBar+="</span>";
      }else {
         pageBar+="<span class='page-item'>";
         pageBar+=" <a class='page-link' href='javascript:fn_paging("+pageNo;
         pageBar+=",\""+searchType+"\",\""+searchKeyword+"\");'>" 
         +"다음"+" </a>	";
         //pageBar+=" <a class='page-link' href='javascript:fn_paging("+pageNo+",'"+searchType+"','"+searchKeyword+"')'> 다음 </a>";
         pageBar+="</span>";
      }
      
      pageBar+="</span>";
       
      
      
      
      
      pageBar+="<script>";
      pageBar+="function fn_paging(pageNo,searchType,searchKeyword){";
      //ori
     // pageBar+="location.assign('" + url + "?cPage='+pageNo ) ;";
      //re
//      pageBar+= "let totalUrl = '" + url + "';";
//      pageBar+= "totalUrl += 'cPage='";
//      pageBar+= "totalUrl += pageNo";
//      pageBar += "location.assign(totalUrl)";
      
      //pageBar+="location.assign('"	 +	url	+	"?cPage="	+	"pageNo"	+	"&searchType="	+	searchType	+	"&searchKeyword="	+	searchKeyword +"');";
      pageBar+="location.assign('"	 +	url	+	"?cPage="	+ "'"+	"+pageNo+" +"'"	+	"&searchType="	+	searchType	+	"&searchKeyword="	+	searchKeyword +"');";

      //병도추가
      //pageBar += "alert("+cPage+")";
      
      
      pageBar+="}";
      pageBar+="</script>";
      
      
      
      return pageBar;
   }
}