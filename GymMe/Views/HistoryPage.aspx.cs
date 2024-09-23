using GymMe.Controllers;
using GymMe.Models;
using GymMe.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GymMe.Views
{
	public partial class HistoryPage : System.Web.UI.Page
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

			if (currUser.UserRole.Equals("Admin"))
			{
				GVHistory.Columns[1].Visible = true;
			}

			RefreshGridview();
		}

		private void RefreshGridview()
		{
			MsUser currUser = Session["user"] as MsUser;

			Response<List<TransactionHeader>> response = currUser.UserRole.Equals("Admin") ? TransactionController.GetAllHeaders() : TransactionController.GetUserHeaders(currUser.UserID);

			if (response.Success)
			{
				GVHistory.DataSource = response.Data;
				GVHistory.DataBind();
			}
			else
			{
				LblError.Text = response.Message;
				LblError.ForeColor = System.Drawing.Color.Red;
			}
		}

		protected void GVHistory_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "Detail")
			{
				Control sourceControl = e.CommandSource as Control;
				GridViewRow row = sourceControl.NamingContainer as GridViewRow;
				int index = row.RowIndex;
				int id = int.Parse(row.Cells[0].Text);
				Response.Redirect("~/Views/HistoryDetail.aspx?Id=" + id);
			}
		}
	}
}