using System;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    protected void grid_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e) {
        ASPxSummaryItem summary = e.Item as ASPxSummaryItem;
        if (summary.FieldName != "UnitsInStock")
            return;

        if (e.IsTotalSummary) {
            int totalValue = 0;
            foreach (object value in grid.GetSelectedFieldValues("UnitsInStock")) {
                totalValue += Convert.ToInt32(value);
            }
            e.TotalValue = totalValue;
            e.TotalValueReady = true;
        }
    }
    protected void grid_SelectionChanged(object sender, EventArgs e) {
        grid.DataBind();
    }
}
