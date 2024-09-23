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
	public partial class ProfilePage : System.Web.UI.Page
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

			if (!IsPostBack)
			{
				TxtName.Text = currUser.UserName;
				TxtEmail.Text = currUser.UserEmail;
				DDLGender.SelectedValue = currUser.UserGender;
				TxtDOB.Text = string.Format("{0:yyyy-MM-dd}", currUser.UserDOB);
			}
		}

		protected void BtnProfile_Click(object sender, EventArgs e)
		{
			MsUser currUser = Session["user"] as MsUser;
			string name = TxtName.Text;
			string email = TxtEmail.Text;
			string gender = DDLGender.SelectedValue;
			string dob = TxtDOB.Text;

			Response<MsUser> response = UserController.UpdateUserProfile(currUser.UserID, name, email, gender, dob);

			LblError.Text = response.Message;
			LblError.ForeColor = (response.Success) ? System.Drawing.Color.Blue : System.Drawing.Color.Red;
		}

		protected void BtnPassword_Click(object sender, EventArgs e)
		{
			MsUser currUser = Session["user"] as MsUser;
			string oldPassword = TxtOldPassword.Text;
			string newPassword = TxtNewPassword.Text;

			Response<MsUser> response = UserController.UpdateUserPassword(currUser.UserID, oldPassword, newPassword);

			LblPasswordError.Text = response.Message;
			LblPasswordError.ForeColor = (response.Success) ? System.Drawing.Color.Blue : System.Drawing.Color.Red;
		}
	}
}