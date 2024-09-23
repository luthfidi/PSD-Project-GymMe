using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Factories
{
	public class TransactionFactory
	{
		public static TransactionHeader CreateHeader(int userID, DateTime transactionDate, string status)
		{
			return new TransactionHeader()
			{
				UserID = userID,
				TransactionDate = transactionDate,
				Status = status
			};
		}

		public static TransactionDetail CreateDetail(int transactionID, int supplementID, int quantity)
		{
			return new TransactionDetail()
			{
				TransactionID = transactionID,
				SupplementID = supplementID,
				Quantity = quantity
			};
		}

	}
}