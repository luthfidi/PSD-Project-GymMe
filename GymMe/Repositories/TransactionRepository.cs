using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Repositories
{
	public class TransactionRepository
	{
		public static List<TransactionHeader> GetAllHeaders()
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.TransactionHeaders.ToList();
		}

		public static List<TransactionHeader> GetAllUserHeaders(int userID)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.TransactionHeaders.Where(t => t.UserID == userID).ToList();
		}

		public static List<TransactionDetail> GetDetailById(int transactionID)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.TransactionDetails.Where(t => t.TransactionID.Equals(transactionID)).ToList();
		}

		public static TransactionHeader GetHeaderById(int id)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			return db.TransactionHeaders.Find(id);
		}

		public static bool UpdateTransactionHeader(TransactionHeader newTransaction)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			TransactionHeader oldTransaction = db.TransactionHeaders.Find(newTransaction.TransactionID);

			if (oldTransaction == null)
			{
				return false;
			}

			oldTransaction.UserID = newTransaction.UserID;
			oldTransaction.TransactionDate = newTransaction.TransactionDate;
			oldTransaction.Status = newTransaction.Status;
			db.SaveChanges();

			return true;
		}

		public static void AddHeader(TransactionHeader header)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			db.TransactionHeaders.Add(header);
			db.SaveChanges();
		}

		public static void AddDetail(TransactionDetail detail)
		{
			LocalDatabaseEntities3 db = DatabaseSingleton.GetInstance();
			db.TransactionDetails.Add(detail);
			db.SaveChanges();
		}
	}
}