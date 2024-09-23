using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;

namespace GymMe.Factories
{
	public class CartFactory
	{
		public static MsCart CreateCart(int userID, int supplementID, int quantity)
		{
			return new MsCart()
			{
				UserID = userID,
				SupplementID = supplementID,
				Quantity = quantity
			};
		}
	}
}