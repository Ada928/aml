<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="签约信息">

	<@CommonQueryMacro.CommonQueryTab id="BOPForDebtSellRepurchaseQueryTabs" navigate="false" currentTab="BOPForDebtSellRepurchaseSignedQuery">
		<@CommonQueryMacro.CommonQuery id="BOPForDebtSellRepurchaseSignedQuery" init="false" submitMode="all" navigate="false" >
			<table align="left">
				<tr>
					<td colspan="2">
						<@CommonQueryMacro.Interface id="interface"  label="请输入查询条件" />
					</td>
				</tr>

				<tr>
  			  		<td>
  			    		<@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="9"   pageCache="false" showArrow="true"/>
  			  		</td>
  			 	</tr>

  			 	<tr>
		      		<td colspan="2">
						<@CommonQueryMacro.DataTable id ="datatable1" fieldStr="filler2[100],brNo[140],brNoName[180],workDate[100],actiontype[80],recStatus[80],approveStatus[80],repStatus[80],exdebtcode[180],debtorcode[120],debtype[80],valuedate[100],contractcurr[120],contractamount[120],maturity[100],anninrate[100],spapfeboindex" readonly="true" hasFrame="true" width="900" height="260"/>
		      		</td>
		      	</tr>
			</table>
		</@CommonQueryMacro.CommonQuery>
	</@CommonQueryMacro.CommonQueryTab>
	<script language="JavaScript">
		var ds = BOPForDebtSellRepurchaseSignedQuery_dataset;

		function initCallGetter_post() {
			var currentDate = "${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTxdate()}";
			BOPForDebtSellRepurchaseSignedQuery_interface_dataset.setValue("qWorkDateBegin", currentDate);
			BOPForDebtSellRepurchaseSignedQuery_interface_dataset.setValue("qWorkDateOver", currentDate);
			ds.setParameter("getType","sign");
		}

	    function datatable1_filler2_onRefresh(cell,value,record) {
			if (record) {//当存在记录时
				var id = record.getValue("id");
				cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + value + "</a>"
			} else {
				cell.innerHTML="&nbsp;";
			}
		}
		//详细
		function doDetail(id) {
			showWin("卖出回购签约信息","${contextPath}/fpages/datacollection/ftl/BOPForDebtSellRepurchaseCol.ftl?id="+id+"&op=detaile","report","flushPage()");
		}
	</script>
</@CommonQueryMacro.page>