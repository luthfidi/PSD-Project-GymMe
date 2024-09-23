using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Repositories
{
	public class CartRepository
	{
		public static void AddToCart(MsCart cart)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			db.MsCarts.Add(cart);
			db.SaveChanges();
		}

		public static List<MsCart> GetAllCarts(int userID)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.MsCarts.Where(c => c.UserID == userID).ToList();
		}

		public static bool DeleteCart(int userID)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			List<MsCart> carts = GetAllCarts(userID);

			if (carts.Count == 0)
			{
				return false;
			}

			foreach (MsCart cart in carts)
			{
				db.MsCarts.Remove(cart);
			}

			db.SaveChanges();
			return true;
		}
	}
}