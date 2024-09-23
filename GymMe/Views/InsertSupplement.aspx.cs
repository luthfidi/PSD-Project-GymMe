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
	public partial class InsertSupplement : System.Web.UI.Page
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

			if (!IsPostBack)
			{
				RefreshDropdown();
			}
		}

		private void RefreshDropdown()
		{
			Response<List<MsSupplementType>> response = SupplementTypeController.GetAllTypes();

			if (response.Success)
			{
                DDLType.DataSource = response.Data;
				DDLType.DataTextField = "SupplementTypeName";
				DDLType.DataValueField = "SupplementTypeID";
				DDLType.DataBind();
			}
			else
			{
				LblError.Text = response.Message;
				LblError.ForeColor = System.Drawing.Color.Red;
			}
		}

		protected void BtnInsert_Click(object sender, EventArgs e)
		{
			string name = TxtName.Text;
			string expiry = TxtExpiry.Text;
			int price = int.Parse(TxtPrice.Text);
			int typeID = int.Parse(DDLType.SelectedValue);

			Response<MsSupplement> response = SupplementController.AddSupplement(name, expiry, price, typeID);

			LblError.Text = response.Message;
			LblError.ForeColor = response.Success ? System.Drawing.Color.Blue : System.Drawing.Color.Red;
		}

		protected void LBBack_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/ManageSupplement.aspx");
		}
	}
}