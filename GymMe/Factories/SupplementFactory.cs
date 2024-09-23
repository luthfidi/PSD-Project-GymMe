using GymMe.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Factories
{
	public class SupplementFactory
	{
		public static MsSupplement CreateSupplement(string name, DateTime expiry, int price, int typeID)
		{
			return new MsSupplement()
			{
				SupplementName = name,
				SupplementExpiryDate = expiry,
				SupplementPrice = price,
				SupplementTypeID = typeID,
			};
		}
	}
}