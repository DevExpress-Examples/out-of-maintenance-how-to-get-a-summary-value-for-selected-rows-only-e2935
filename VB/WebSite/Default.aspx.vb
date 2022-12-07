Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub grid_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs)
		Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)
		If summary.FieldName <> "UnitsInStock" Then
			Return
		End If

		If e.IsTotalSummary Then
			Dim totalValue As Integer = 0
			For Each value As Object In grid.GetSelectedFieldValues("UnitsInStock")
				totalValue += Convert.ToInt32(value)
			Next value
			e.TotalValue = totalValue
			e.TotalValueReady = True
		End If
	End Sub
	Protected Sub grid_SelectionChanged(ByVal sender As Object, ByVal e As EventArgs)
		grid.DataBind()
	End Sub
End Class
