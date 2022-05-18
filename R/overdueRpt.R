#' 业务应收逾期报表
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param app_id 程序ID
#'
#' @return 返回值
#' @export
#'
#' @examples
#' overdueRptServer()
overdueRptServer <- function(input,output,session,app_id){

var_date = tsui::var_date('saleOverdueRpt_queryDate_date')

shiny::observeEvent(input$saleOverdueRpt_upload_btn,{
  FDate = as.character(var_date())
  data  = overDueRpt_Query(FDate = FDate,Fdepartment = '外贸销售部',FBusinessGroup = '外贸',FBusinessMan = 'Victor',FDataScope = '本人')
  tsui::run_dataTable2(id = 'saleOverdueRpt_query_dataview',data = data)
  file_name = paste0("业务应收逾期报表_",FDate,".xlsx")
  tsui::run_download_xlsx(id = 'saleOverdueRpt_upload_btn',data = data,filename = file_name)




})






}
