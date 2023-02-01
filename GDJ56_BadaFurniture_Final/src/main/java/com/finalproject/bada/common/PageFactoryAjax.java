package com.finalproject.bada.common;

public class PageFactoryAjax {
   
   public static String getPage(int cPage, int numPerpage, int totalData, String url) {

      String pageBar="";
      int totalPage=(int)Math.ceil((double)totalData/numPerpage);
      int pageBarSize=10;
      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
      int pageEnd=pageNo+pageBarSize-1;

      
      pageBar="<span class='pagination justify-content-center pagination-sm'>";
      
      if(pageNo==1) {
         pageBar+="<span class='page-item'>";
         pageBar+=" <a class='page-link' href='#'> 이전 </a>";
         pageBar+="</span>";
      }else {
         pageBar+="<span class='page-item'>";
         pageBar+=" <a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'> 이전 </a>";
         pageBar+="</span>";
      }
      
      while(!(pageNo>pageEnd||pageNo>totalPage)) {
         if(cPage==pageNo) {
            pageBar+="<span class='page-item'>";
            pageBar+=" <a class='page-link' href='#'> "+pageNo+" </a>";
            pageBar+="</span>";
         }else {
            pageBar+="<span class='page-item'>";
            pageBar+=" <a class='page-link' href='javascript:fn_paging("+(pageNo)+")'> "
            +pageNo+" </a>";
            pageBar+="</span>";
         }
         pageNo++;
      }
      
      if(pageNo>totalPage) {
         pageBar+="<span class='page-item'>";
         pageBar+=" <a class='page-link' href='#'> 다음 </a>";
         pageBar+="</span>";
      }else {
         pageBar+="<span class='page-item'>";
         pageBar+=" <a class='page-link' href='javascript:fn_paging("+(pageNo)+")'> 다음 </a>";
         pageBar+="</span>";
      }
      
      pageBar+="</span>";
      
      return pageBar;
   }
}