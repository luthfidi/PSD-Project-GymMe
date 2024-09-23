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
	public partial class HomePage : System.Web.UI.Page
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
			LblName.Text = currUser.UserName;
			LblRole.Text = currUser.UserRole;

			if (currUser.UserRole.Equals("Admin"))
			{
				GVUsers.Visible = true;
				RefreshGridview();
			}
		}

		private void RefreshGridview()
		{
			Response<List<MsUser>> response = UserController.GetAllCustomers();

			if (response.Success)
			{
				GVUsers.DataSource = response.Data;
				GVUsers.DataBind();
			}
		}
	}
}