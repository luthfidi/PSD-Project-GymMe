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
	public partial class OrderQueuePage : System.Web.UI.Page
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
				RefreshOrderQueue();
			}
		}

		private void RefreshOrderQueue()
		{
			Response<List<TransactionHeader>> response = TransactionController.GetAllHeaders();

			if (response.Success)
			{
				GVOrders.DataSource = response.Data;
				GVOrders.DataBind();
			}
		}

		protected void GVOrders_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName.Equals("Handle"))
			{
				Control sourceControl = e.CommandSource as Control;
				GridViewRow row = sourceControl.NamingContainer as GridViewRow;
				int index = row.RowIndex;
				int id = int.Parse(GVOrders.Rows[index].Cells[0].Text);

				Response<TransactionHeader> response = TransactionController.UpdateTransactionStatus(id, "Handled");

				LblError.Text = response.Message;
				LblError.ForeColor = (response.Success) ? System.Drawing.Color.Blue : System.Drawing.Color.Red;

				RefreshOrderQueue();
			}
		}
        protected string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "pending":
                    return "px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800";
                case "processing":
                    return "px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800";
                case "completed":
                    return "px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800";
                default:
                    return "px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-gray-100 text-gray-800";
            }
        }

        protected string GetActionButtonText(string status)
        {
            switch (status.ToLower())
            {
                case "pending":
                    return "Process";
                case "processing":
                    return "Complete";
                case "completed":
                    return "View Details";
                default:
                    return "Handle";
            }
        }

        protected string GetActionButtonClass(string status)
        {
            string baseClass = "bg-blue-500 hover:bg-blue-600 text-white py-1 px-3 rounded transition duration-300 ease-in-out";
            switch (status.ToLower())
            {
                case "pending":
                    return baseClass.Replace("bg-blue-500 hover:bg-blue-600", "bg-yellow-500 hover:bg-yellow-600");
                case "processing":
                    return baseClass.Replace("bg-blue-500 hover:bg-blue-600", "bg-green-500 hover:bg-green-600");
                case "completed":
                    return baseClass.Replace("bg-blue-500 hover:bg-blue-600", "bg-gray-500 hover:bg-gray-600");
                default:
                    return baseClass;
            }
        }
    }
}