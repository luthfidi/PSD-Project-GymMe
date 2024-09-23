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

namespace GymMe.Layouts
{
	public partial class Navbar : System.Web.UI.MasterPage
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

			MsUser user = Session["user"] as MsUser;
			string role = user.UserRole;

			switch (role)
			{
				case "Admin":
					AdminPanel.Visible = true;
					break;
				case "Customer":
					CustomerPanel.Visible = true;
					break;
				default:
					break;
			}

		}
		protected void LBOrderSupplement_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/OrderSupplement.aspx");
		}

		protected void LBHistory_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/HistoryPage.aspx");
		}

		protected void LBProfile_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/ProfilePage.aspx");
		}

		protected void LBLogOut_Click(object sender, EventArgs e)
		{
			HttpCookie cookie = Request.Cookies["user_cookie"];

			if (cookie != null)
			{
				cookie.Expires = DateTime.Now.AddDays(-1);
				Response.Cookies.Add(cookie);
			}

			Session.Remove("user");
			Response.Redirect("~/Views/LoginPage.aspx");
		}

		protected void LBHome_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/HomePage.aspx");
		}

		protected void LBManageSupplement_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/ManageSupplement.aspx");
		}

		protected void LBOrderQueue_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/OrderQueuePage.aspx");
		}

		protected void LBProfile1_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/ProfilePage.aspx");
		}

		protected void LBTReport_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/ReportPage.aspx");
		}

		protected void LBLogOut1_Click(object sender, EventArgs e)
		{
			HttpCookie cookie = Request.Cookies["user_cookie"];
			
			if (cookie != null)
			{
				cookie.Expires = DateTime.Now.AddDays(-1);
				Response.Cookies.Add(cookie);
			}

			Session.Remove("user");
			Response.Redirect("~/Views/LoginPage.aspx");
		}

		protected void LBLogo_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/HomePage.aspx");
		}

		protected void LBCartPage_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/CartPage.aspx");
		}

        protected void LBHistory1_Click(object sender, EventArgs e)
        {
			Response.Redirect("~/Views/HistoryPage.aspx");
        }
    }
}