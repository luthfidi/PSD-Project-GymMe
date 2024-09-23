using GymMe.Controllers;
using GymMe.Factories;
using GymMe.Models;
using GymMe.Modules;
using GymMe.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.WebParts;

namespace GymMe.Handlers
{
    public class CartHandler
    {
        public static Response<List<MsCart>> GetAllCarts(int userID)
        {
            List<MsCart> carts = CartRepository.GetAllCarts(userID);

            if (carts.Count == 0)
            {
                return new Response<List<MsCart>>(false, "No carts found", null);
            }

            return new Response<List<MsCart>>(true, "Carts retrieval successful", carts);
        }

        public static Response<MsCart> AddToCart(int userID, int supplementID, int quantity)
        {
            MsCart cart = CartFactory.CreateCart(userID, supplementID, quantity);
            CartRepository.AddToCart(cart);
            return new Response<MsCart>(true, "Added to cart successfully", cart);
        }

        public static Response<MsCart> CheckoutCart(int userID)
        {
            List<MsCart> carts = CartRepository.GetAllCarts(userID);

            if (carts.Count == 0)
            {
                return new Response<MsCart>(false, "No carts found", null);
            }

            Response<TransactionHeader> responseHeader = TransactionController.AddHeader(userID, DateTime.Now, "Unhandled");

            if (!responseHeader.Success)
            {
                return new Response<MsCart>(false, responseHeader.Message, null);
            }

            foreach (MsCart cart in carts)
            {
                Response<TransactionDetail> responseDetail = TransactionController.AddDetail(responseHeader.Data.TransactionID, cart.SupplementID, cart.Quantity);

                if (!responseDetail.Success)
                {
                    return new Response<MsCart>(false, responseDetail.Message, null);
                }
            }

            bool deleted = CartRepository.DeleteCart(userID);

            if (!deleted)
            {
                return new Response<MsCart>(false, "Failed to clear cart", null);
            }

            return new Response<MsCart>(true, "Successfully checked out cart", null);
        }

        public static Response<MsCart> ClearCart(int userID)
        {
            bool isDeleted = CartRepository.DeleteCart(userID);

            if (isDeleted)
            {
                return new Response<MsCart>(true, "Cart cleared successfully", null);
            }

            return new Response<MsCart>(false, "No carts found", null);
        }
    }
}
