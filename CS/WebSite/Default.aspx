<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>How to get a summary value for selected rows only</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
            DataSourceID="datasSource" 
            oncustomsummarycalculate="grid_CustomSummaryCalculate" 
            onselectionchanged="grid_SelectionChanged" KeyFieldName="ProductID">
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="UnitsInStock" ShowInColumn="Units In Stock" 
                    SummaryType="Custom" />
            </TotalSummary>
            <Columns>
                <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ProductID" VisibleIndex="0" 
                    ReadOnly="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductName" 
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ProcessSelectionChangedOnServer="True" />
            <Settings ShowFooter="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="datasSource" runat="server" 
            ConnectionString="Data Source=(local);Initial Catalog=Northwind;Integrated Security=True" ProviderName="System.Data.SqlClient"            
            SelectCommand="SELECT [ProductName], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ProductID] FROM [Products]">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
