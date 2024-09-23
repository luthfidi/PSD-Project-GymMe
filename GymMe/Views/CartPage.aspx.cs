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
	public partial class CartPage : System.Web.UI.Page
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
			Response<List<MsCart>> response = CartController.GetAllCarts((Session["user"] as MsUser).UserID);

			if (response.Success)
			{
				GVCart.DataSource = response.Data;
				GVCart.DataBind();
			}
		}

        protected void BtnCheckout_Click(object sender, EventArgs e)
        {
			Response<MsCart> response = CartController.CheckoutCart((Session["user"] as MsUser).UserID);

			LblError.Text = response.Message;
			LblError.ForeColor = (response.Success) ? System.Drawing.Color.Blue : System.Drawing.Color.Red;

			if (response.Success)
			{
				RefreshGridview();
			}
        }

		protected void BtnClear_Click(object sender, EventArgs e)
		{
			Response<MsCart> response = CartController.ClearCart((Session["user"] as MsUser).UserID);

			LblError.Text = response.Message;
			LblError.ForeColor = (response.Success) ? System.Drawing.Color.Blue : System.Drawing.Color.Red;

			if (response.Success)
			{
				RefreshGridview();
			}
		}
	}
}