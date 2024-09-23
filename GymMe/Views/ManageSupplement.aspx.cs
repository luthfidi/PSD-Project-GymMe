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
	public partial class ManageSupplement : System.Web.UI.Page
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

			RefreshGridview();
		}

		private void RefreshGridview()
		{
			Response<List<MsSupplement>> response = SupplementController.GetAllSupplements();

			if (response.Success)
			{
				GVSupplement.DataSource = response.Data;
				GVSupplement.DataBind();
			}
		}

        protected void BtnInsert_Click(object sender, EventArgs e)
        {
			Response.Redirect("~/Views/InsertSupplement.aspx");
        }

		protected void GVSupplement_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			GridViewRow row = GVSupplement.Rows[e.RowIndex];
			int id = int.Parse(row.Cells[0].Text);

			Response<MsSupplement> response = SupplementController.DeleteSupplement(id);

			LblError.Text = response.Message;
			LblError.ForeColor = (response.Success) ? System.Drawing.Color.Blue : System.Drawing.Color.Red;
			RefreshGridview();
		}

		protected void GVSupplement_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{
			GridViewRow row = GVSupplement.Rows[e.RowIndex];
			int id = int.Parse(row.Cells[0].Text);
			Response.Redirect("~/Views/UpdateSupplement.aspx?Id=" + id);
		}
	}
}