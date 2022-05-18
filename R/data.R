#' 业务应收逾期报表查询
#'
#' @param erp_token 口令
#' @param FDate 日期
#' @param Fdepartment 部门
#' @param FBusinessGroup 业务组
#' @param FBusinessMan 业务员
#' @param FCompanyScope 公司范围
#' @param FDataScope 数据范围
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overDueRpt_Query()
overDueRpt_Query <- function(erp_token ='C0426D23-1927-4314-8736-A74B2EF7A039',
                 FDate ='2022-05-12',
                 Fdepartment ='方案中心',
                 FBusinessGroup='华东区',
                 FBusinessMan = 'hawken',
                 FCompanyScope ='所有公司',
                 FDataScope = '本部门'
                 ) {

conn = tsda::sql_getConn(token = erp_token)
if (FCompanyScope =='所有公司'){
  #所有公司
  if(FDataScope == '所有部门'){
    ##所有公司所有部门
    sql <- paste0("select * from takewiki_vw_ar_orverDue
where 截止日期 ='",FDate,"'")
  }
  if(FDataScope == '本部门'){

    sql <- paste0("select * from takewiki_vw_ar_orverDue
where 截止日期 ='",FDate,"'  and 销售部门 = '",Fdepartment,"' ")

  }
  if(FDataScope =='本业务组'){

    sql <- paste0("select * from takewiki_vw_ar_orverDue
where 截止日期 ='",FDate,"'  and 销售区域 = '",FBusinessGroup,"' ")
  }

  if(FDataScope == '本人'){
    sql <- paste0("select * from takewiki_vw_ar_orverDue
where 截止日期 ='",FDate,"'  and  销售员 ='",FBusinessMan,"' ")
  }


}else{



  #分公司处理
  if(FDataScope == '所有部门'){
    ##所有公司所有部门
    sql <- paste0("select * from takewiki_vw_ar_orverDue
where 截止日期 ='",FDate,"' and 销售组织 ='",FCompanyScope,"'")
  }
  if(FDataScope == '本部门'){

    sql <- paste0("select * from takewiki_vw_ar_orverDue
where 截止日期 ='",FDate,"'  and 销售部门 = '",Fdepartment,"' and 销售组织 ='",FCompanyScope,"'")

  }
  if(FDataScope =='本业务组'){

    sql <- paste0("select * from takewiki_vw_ar_orverDue
where 截止日期 ='",FDate,"'  and 销售区域 = '",FBusinessGroup,"' and 销售组织 ='",FCompanyScope,"'")
  }

  if(FDataScope == '本人'){
    sql <- paste0("select * from takewiki_vw_ar_orverDue
where 截止日期 ='",FDate,"'  and  销售员 ='",FBusinessMan,"' and 销售组织 ='",FCompanyScope,"'")
  }


}

data = tsda::sql_select(conn,sql)
return(data)

}
