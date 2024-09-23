using GymMe.Controllers;
using GymMe.Models;
using GymMe.Modules;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GymMe.Views
{
	public partial class OrderSupplement : System.Web.UI.Page
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
				Response.Redirect("~/Views/HomePage.aspx");
				return;
			}

			if (!IsPostBack)
			{
				RefreshGridview();
			}
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

        protected void GVSupplement_RowCommand(object sender, GridViewCommandEventArgs e)
        {
			int userID = (Session["user"] as MsUser).UserID;
			if (e.CommandName == "Order")
			{
				Control sourceControl = e.CommandSource as Control;
				GridViewRow row = sourceControl.NamingContainer as GridViewRow;
				int index = row.RowIndex;
				int id = int.Parse(row.Cells[0].Text);

				TextBox txtQuantity = row.FindControl("TxtQuantity") as TextBox;
				int quantity = txtQuantity.Text == "" ? 0 : int.Parse(txtQuantity.Text);

				Response<MsCart> response = CartController.AddToCart(userID, id, quantity);

				LblError.Text = response.Message;
				LblError.ForeColor = (response.Success) ? System.Drawing.Color.Blue : System.Drawing.Color.Red;

				RefreshGridview();
			}
		}
    }
}