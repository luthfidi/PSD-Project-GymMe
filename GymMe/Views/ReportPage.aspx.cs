using GymMe.Controllers;
using GymMe.Datasets;
using GymMe.Models;
using GymMe.Modules;
using GymMe.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GymMe.Views
{
	public partial class ReportPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["user"] == null && Request.Cookies["user_cookie"] == null)
			{
				Response.Redirect("~/Views/LoginPage.aspx");
				return;
			}

			if (Session["user"] == null)
			{
				string cookie = Request.Cookies["user_cookie"].Value;
				Response<MsUser> response = UserController.LoginUserByCookie(cookie);

				if (!response.Success)
				{
					Response.Cookies["user_cookie"].Expires = DateTime.Now.AddDays(-1);
					Response.Redirect("~/Views/LoginPage.aspx");
					return;
				}

				Session["user"] = response.Data;
			}

			MsUser currUser = Session["user"] as MsUser;

			if (currUser.UserRole.Equals("Customer"))
			{
				Response.Redirect("~/Views/HomePage.aspx");
				return;
			}

			InitReport();
		}
		
		private void InitReport()
		{
			Response<List<TransactionHeader>> transactionResponse = TransactionController.GetAllHeaders();

			if (!transactionResponse.Success)
			{
				return;
			}

			Response<List<MsSupplementType>> typeResponse = SupplementTypeController.GetAllTypes();

			if (!typeResponse.Success)
			{
				return;
			}

			Response<List<MsSupplement>> supplementResponse = SupplementController.GetAllSupplements();

			if (!supplementResponse.Success)
			{
				return;
			}

			Response<List<MsUser>> userResponse = UserController.GetAllCustomers();

			if (!userResponse.Success)
			{
				return;
			}

			TransactionReport report = new TransactionReport();
			CrystalReportViewer.ReportSource = report;
			report.SetDataSource(GetDataset(transactionResponse.Data, typeResponse.Data, supplementResponse.Data, userResponse.Data));
        }

		private TransactionDataset GetDataset(List<TransactionHeader> transactions, List<MsSupplementType> types, List<MsSupplement> supplements, List<MsUser> users)
		{
			TransactionDataset transactionDataset = new TransactionDataset();

			var headerTable = transactionDataset.TransactionHeader;
			var detailTable = transactionDataset.TransactionDetail;
			var userTable = transactionDataset.MsUser;
			var supplementsTable = transactionDataset.MsSupplement;
			var typesTable = transactionDataset.MsSupplementType;

			foreach (MsSupplement supplement in supplements)
			{
				var supplementRow = supplementsTable.NewRow();
				supplementRow["SupplementID"] = supplement.SupplementID;
				supplementRow["SupplementName"] = supplement.SupplementName;
				supplementRow["SupplementPrice"] = supplement.SupplementPrice;
				supplementRow["SupplementExpiryDate"] = supplement.SupplementExpiryDate;
				supplementRow["SupplementTypeID"] = supplement.SupplementTypeID;
				supplementsTable.Rows.Add(supplementRow);
			}

			foreach (MsSupplementType type in types)
			{
				var typeRow = typesTable.NewRow();
				typeRow["SupplementTypeID"] = type.SupplementTypeID;
				typeRow["SupplementTypeName"] = type.SupplementTypeName;
				typesTable.Rows.Add(typeRow);
			}

			foreach (MsUser user in users)
			{
				var userRow = userTable.NewRow();
				userRow["UserID"] = user.UserID;
				userRow["UserName"] = user.UserName;
				userTable.Rows.Add(userRow);
			}

			foreach (TransactionHeader header in transactions)
			{
				var headerRow = headerTable.NewRow();
				headerRow["TransactionID"] = header.TransactionID;
				headerRow["UserID"] = header.UserID;
				headerRow["TransactionDate"] = header.TransactionDate;
				headerRow["Status"] = header.Status;

				decimal subtotal = 0;

				foreach (TransactionDetail detail in header.TransactionDetails)
				{
					var detailRow = detailTable.NewRow();
					detailRow["TransactionID"] = detail.TransactionID;
					detailRow["SupplementID"] = detail.SupplementID;
					detailRow["Quantity"] = detail.Quantity;
					detailTable.Rows.Add(detailRow);
					subtotal += (detail.Quantity * detail.MsSupplement.SupplementPrice);
				}

				headerRow["Subtotal"] = subtotal;
				headerTable.Rows.Add(headerRow);
			}

			return transactionDataset;
		}
	}
}