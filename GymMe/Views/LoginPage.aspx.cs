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
	public partial class LoginPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			LblError.ForeColor = System.Drawing.Color.Red;

			if (Session["user"] != null || Request.Cookies["user_cookie"] != null)
			{
				Response.Redirect("~/Views/HomePage.aspx");
				return;
			}
		}

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
			string username = TxtUsername.Text;
			string password = TxtPassword.Text;

			Response<MsUser> response = UserController.LoginUser(username, password);

			if (!response.Success)
			{
				LblError.Text = response.Message;
				return;
			}

			if (ChkRememberMe.Checked)
			{
				HttpCookie cookie = new HttpCookie("user_cookie")
				{
					Value = response.Data.UserID.ToString(),
					Expires = DateTime.Now.AddHours(1)
				};
				Response.Cookies.Add(cookie);
			}

			Session["user"] = response.Data;
			Response.Redirect("~/Views/HomePage.aspx");
        }

		protected void LBRegister_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/RegisterPage.aspx");
		}
	}
}