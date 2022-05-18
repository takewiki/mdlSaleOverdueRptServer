mydata = overDueRpt_Query()
View(mydata)

#总监权限
mydata = overDueRpt_Query(Fdepartment = '外贸销售部',FBusinessGroup = '外贸',FBusinessMan = 'Victor',FDataScope = '本部门')
View(mydata)

#本人
mydata = overDueRpt_Query(Fdepartment = '外贸销售部',FBusinessGroup = '外贸',FBusinessMan = 'Victor',FDataScope = '本人')
View(mydata)
