using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Repositories
{
	public class SupplementRepository
	{
		public static List<MsSupplement> GetAllSupplements()
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.MsSupplements.ToList();
		}

		public static void AddSupplement(MsSupplement supplement)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			db.MsSupplements.Add(supplement);
			db.SaveChanges();
		}

		public static MsSupplement GetSupplementById(int id)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.MsSupplements.Find(id);
		}

		public static bool UpdateSupplement(MsSupplement newSupplement)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			MsSupplement oldSupplement = db.MsSupplements.Find(newSupplement.SupplementID);

			if (oldSupplement == null)
			{
				return false;
			}

			oldSupplement.SupplementName = newSupplement.SupplementName;
			oldSupplement.SupplementExpiryDate = newSupplement.SupplementExpiryDate;
			oldSupplement.SupplementPrice = newSupplement.SupplementPrice;
			oldSupplement.SupplementTypeID = newSupplement.SupplementTypeID;
			db.SaveChanges();

			return true;
		}

		public static bool DeleteSupplement(int supplementID)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();

			MsSupplement deleted = db.MsSupplements.Find(supplementID);

			if (deleted == null)
			{
				return false;
			}

			db.MsSupplements.Remove(deleted);
			db.SaveChanges();

			return true;
		}
	}
}