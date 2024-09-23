using GymMe.Handlers;
using GymMe.Models;
using GymMe.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GymMe.Controllers
{
    public class SupplementController
    {
        public static Response<List<MsSupplement>> GetAllSupplements()
        {
            return SupplementHandler.GetAllSupplements();
        }

        public static Response<MsSupplement> AddSupplement(string name, string expiry, int price, int typeID)
        {
            string error = "";
            if (name == "" || expiry == "" || price <= 0 || typeID == 0)
            {
                error = "All fields are required.";
            }
            else if (expiry != "")
            {
                DateTime date = DateTime.Parse(expiry);
                if (date <= DateTime.Now)
                {
                    error = "The supplement has expired.";
                }
            }
            else if (!name.Contains("Supplement"))
            {
                error = "Name must contain \"Supplement\".";
            }
            else if (price < 3000)
            {
                error = "Price must be at least 3000.";
            }

            if (error != "")
            {
                return new Response<MsSupplement>(false, error, null);
            }

            return SupplementHandler.AddSupplement(name, DateTime.Parse(expiry), price, typeID);
        }

        public static Response<MsSupplement> UpdateSupplement(int id, string name, string expiry, int price, int typeID)
        {
            string error = "";
            if (id == 0 || name == "" || expiry == "" || price <= 0 || typeID == 0)
            {
                error = "All fields are required.";
            }
            else if (expiry != "")
            {
                DateTime date = DateTime.Parse(expiry);
                if (date <= DateTime.Now)
                {
                    error = "The supplement has expired.";
                }
            }
            else if (!name.Contains("Supplement"))
            {
                error = "Name must contain \"Supplement\".";
            }
            else if (price < 3000)
            {
                error = "Price must be at least 3000.";
            }

            if (error != "")
            {
                return new Response<MsSupplement>(false, error, null);
            }

            return SupplementHandler.UpdateSupplement(id, name, DateTime.Parse(expiry), price, typeID);
        }

        public static Response<MsSupplement> GetSupplementById(int id)
        {
            if (id == 0)
            {
                return new Response<MsSupplement>(false, "Invalid ID.", null);
            }

            return SupplementHandler.GetSupplementById(id);
        }

        public static Response<MsSupplement> DeleteSupplement(int supplementID)
        {
            if (supplementID == 0)
            {
                return new Response<MsSupplement>(false, "Invalid ID.", null);
            }

            return SupplementHandler.DeleteSupplement(supplementID);
        }
    }
}
